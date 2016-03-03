//
//  AWADTicketsRepositoryImpl.m
//  AWAD
//
//  Created by user on 03.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADTicketsRepositoryImpl.h"
#import "AWADTicketsResultModel.h"
#import "AWADTicketsItemModel.h"
#import "AWADTicketsFareItem.h"
#import <RestKit/ObjectMapping.h>
#import <RestKit/ObjectMapping/RKObjectMappingOperationDataSource.h>
@interface AWADTicketsRepositoryImpl()


@property (strong, nonatomic) NSURLSession *urlSession;

@end

@implementation AWADTicketsRepositoryImpl{
    NSString* _baseUrl;
//    void (^_percentCallback) (double *percentValue);
}


-(instancetype)initWithBaseUrl:(NSString *)baseUrl{
    self = [super init];
    if (self) {
        _baseUrl = baseUrl;
        self.urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return self;
}

#pragma mark - AWADTicketsRepository

- (PMKPromise *)ticketsForString:(NSString *)text{
    
    return [PMKPromise promiseWithResolver:^(PMKResolver resolve) {
        NSURL *requestURL = [self requestURLForText:text];
        [[self.urlSession dataTaskWithURL:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                resolve(error);
                return;
            }
            
            NSError *parsingError = nil;
            id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&parsingError];
            if (parsingError) {
                resolve(parsingError);
                return;
            }
            AWADTicketsResultModel* result = [self mapObjects:json error:&parsingError];
            if (parsingError) {
                resolve(parsingError);
                return;
            }
            
            resolve(result.items);

            
        }]resume];
        
        
    }];
}

#pragma mark - Mapping

-(AWADTicketsResultModel*) mapObjects:(id)json error:(NSError **)error{
    
    RKObjectMapping *fareItem = [RKObjectMapping mappingForClass:[AWADTicketsFareItem class]];
    [fareItem addAttributeMappingsFromDictionary:@{@"TotalAmount":@"totalAmount"}];
    
    RKObjectMapping *itemResult = [RKObjectMapping mappingForClass:[AWADTicketsItemModel class]];
     [itemResult addAttributeMappingsFromDictionary:@{@"Code":@"code"}];
    
    
    
    [itemResult addPropertyMappingsFromArray:@[[RKRelationshipMapping relationshipMappingFromKeyPath:@"Fares" toKeyPath:@"fares" withMapping:fareItem]]];
    
    
    RKObjectMapping *resultMapping = [RKObjectMapping mappingForClass:[AWADTicketsResultModel class]];
    [resultMapping addPropertyMappingsFromArray:@[[RKRelationshipMapping relationshipMappingFromKeyPath:@"Airlines" toKeyPath:@"items" withMapping:itemResult]]];
    
    AWADTicketsResultModel *result = [[AWADTicketsResultModel alloc] init];
    
    RKMappingOperation *mappingOperation = [[RKMappingOperation alloc] initWithSourceObject:json destinationObject:result mapping:resultMapping];
    RKObjectMappingOperationDataSource *mappingDS = [RKObjectMappingOperationDataSource new];
    mappingOperation.dataSource = mappingDS;
    NSError *mappingError = nil;
    BOOL isMappingSuccessful = [mappingOperation performMapping:&mappingError];
    if (isMappingSuccessful && mappingError == nil) {
        return result;
    }
    else {
        *error = mappingError;
        return nil;
    }
    
}


#pragma mark - Helpers
-(NSURL *)requestURLForText:(NSString*)text{
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:_baseUrl];
    [urlComponents setQuery:[NSString stringWithFormat:@"L=RU&C=RUB&DebugFullNames=true&_Serialize= JSON&R=%@",text]];
    
    return [urlComponents URL];
}

@end
