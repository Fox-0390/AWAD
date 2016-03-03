//
//  AWADCitySuggestRepositoryImpl.m
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADCitySuggestRepositoryImpl.h"
#import "AWADCitySuggestResult.h"
#import "AWADCitySuggestModel.h"
#import <RestKit/ObjectMapping.h>
#import <RestKit/ObjectMapping/RKObjectMappingOperationDataSource.h>

@interface AWADCitySuggestRepositoryImpl()

@property (strong, nonatomic) NSURLSession *urlSession;

@end



@implementation AWADCitySuggestRepositoryImpl{
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

#pragma mark - AWADCitySuggestRepository protocol

-(PMKPromise *)suggestCityForText:(NSString *)text{
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
            AWADCitySuggestResult* result = [self mapObjects:json error:&parsingError];
            if (parsingError) {
                resolve(parsingError);
                return;
            }
            resolve(result.items);
            
        }] resume];
    }];
}

#pragma mark - Mapping

-(AWADCitySuggestResult*) mapObjects:(id)json error:(NSError **)error{
    
    RKObjectMapping *suggestItemMapping = [RKObjectMapping mappingForClass:[AWADCitySuggestModel class]];
    [suggestItemMapping addAttributeMappingsFromDictionary:@{@"Code":@"code", @"City": @"city",@"Country": @"country", @"Airport":@"airport", @"Data":@"data", @"CityCode" : @"cityCode"}];
    
    RKObjectMapping *citySuggestsResult = [RKObjectMapping mappingForClass:[AWADCitySuggestResult class]];
    [citySuggestsResult addPropertyMappingsFromArray:@[[RKRelationshipMapping relationshipMappingFromKeyPath:@"Array" toKeyPath:@"items" withMapping:suggestItemMapping]]];
    
    AWADCitySuggestResult *result = [[AWADCitySuggestResult alloc] init];
    
     RKMappingOperation *mappingOperation = [[RKMappingOperation alloc] initWithSourceObject:json destinationObject:result mapping:citySuggestsResult];
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
    [urlComponents setQuery:[NSString stringWithFormat:@"language=RU&filter=%@&_Serialize=JSON",text]];
    
    return [urlComponents URL];
}

@end
