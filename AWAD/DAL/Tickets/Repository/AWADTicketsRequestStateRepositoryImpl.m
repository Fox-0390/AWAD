//
//  AWADTicketsRequestStateRepositoryImpl.m
//  AWAD
//
//  Created by user on 03.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADTicketsRequestStateRepositoryImpl.h"
#import <RestKit/ObjectMapping.h>
#import <RestKit/ObjectMapping/RKObjectMappingOperationDataSource.h>
#import "AWADTickerRequestState.h"

@interface AWADTicketsRequestStateRepositoryImpl()

@property (strong, nonatomic) NSURLSession *urlSession;

@end

@implementation AWADTicketsRequestStateRepositoryImpl{
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

- (PMKPromise *)ticketRequestState:(NSString *)text callBackPercent:(percentCallback) callback{
    __weak typeof(self) _welf = self;
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
            AWADTickerRequestState* result = [self mapObjects:json error:&parsingError];
            if (parsingError) {
                resolve(parsingError);
                return;
            }
            if ([result.completed doubleValue] < 100) {
               
                callback([result.completed doubleValue]);
                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC));
                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                    resolve([_welf ticketRequestState:text callBackPercent:^(double percent) {
                        callback(percent);
                        
                    }]);                });
              
                
               
            }
            else
            {
                resolve(result);
            }
            
        }]resume];
    }];
}


#pragma mark - Mapping

-(AWADTickerRequestState*) mapObjects:(id)json error:(NSError **)error{
    
    RKObjectMapping *searchRequestItemMapping = [RKObjectMapping mappingForClass:[AWADTickerRequestState class]];
    [searchRequestItemMapping addAttributeMappingsFromDictionary:@{@"Error":@"error", @"Completed": @"completed"}];
    
    AWADTickerRequestState* result = [AWADTickerRequestState new];
    
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
                [urlComponents setQuery:[NSString stringWithFormat:@"R=%@&_Serialize=JSON",text]];
                
                return [urlComponents URL];
            }
            
@end
