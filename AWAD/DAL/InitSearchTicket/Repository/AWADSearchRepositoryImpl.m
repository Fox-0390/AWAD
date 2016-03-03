//
//  AWADSearchRepositoryImpl.m
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//


#import "AWADSearchRepositoryImpl.h"
#import "AWADSearchRequestModel.h"
#import <RestKit/ObjectMapping.h>
#import <RestKit/ObjectMapping/RKObjectMappingOperationDataSource.h>

@interface AWADSearchRepositoryImpl()
@property (strong, nonatomic) NSURLSession *urlSession;

@end

@implementation AWADSearchRepositoryImpl{
    NSString* _baseUrl;
}


-(instancetype)initWithBaseUrl:(NSString *)baseUrl{
    self = [super init];
    if (self) {
        _baseUrl = baseUrl;
        self.urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return self;
}


-(PMKPromise *)searchForText:(NSString *)text{
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
            NSLog(@"%@",json);
            AWADSearchRequestModel* result = [self mapObjects:json error:&parsingError];
            if (parsingError) {
                resolve(parsingError);
                return;
            }
            resolve(result);
            
            
        }]resume];
        
    }];
}

#pragma mark - Mapping

-(AWADSearchRequestModel*) mapObjects:(id)json error:(NSError **)error{
    
    RKObjectMapping *searchRequestItemMapping = [RKObjectMapping mappingForClass:[AWADSearchRequestModel class]];
    [searchRequestItemMapping addAttributeMappingsFromDictionary:@{@"Error":@"error", @"Id": @"idValue",@"IdSynonym": @"synonym"}];
    
    AWADSearchRequestModel* result = [AWADSearchRequestModel new];
    
    RKMappingOperation *mappingOperation = [[RKMappingOperation alloc] initWithSourceObject:json destinationObject:result mapping:searchRequestItemMapping];
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
    [urlComponents setQuery:[NSString stringWithFormat:@"Route=%@AD1CN0IN0SCE&_Serialize=JSON",text]];
    
    return [urlComponents URL];
}

@end
