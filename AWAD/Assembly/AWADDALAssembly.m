//
//  AWADDALAssembly.m
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADDALAssembly.h"
#import "AWADCitySuggestRepositoryImpl.h"
#import "AWADCitySuggestServiceImpl.h"
#import "AWADSearchRepositoryImpl.h"
#import "AWADSearchServiceImpl.h"
#import "AWADTicketsRepositoryImpl.h"
#import "AWADTicketsRequestStateRepositoryImpl.h"
#import "AWADTicketsServiceImpl.h"
@implementation AWADDALAssembly

- (id)config {
    return [TyphoonDefinition withConfigName:@"Configuration.plist"];
}




-(id<AWADCitySuggestRepository>)citySuggestsRepository{
    return [TyphoonDefinition withClass:[AWADCitySuggestRepositoryImpl class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithBaseUrl:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:TyphoonConfig(@"citySuggest_Base_Url")];
            definition.scope = TyphoonScopeLazySingleton;
        }];
    }];
}

-(id<AWADCitySuggestService>)citySuggestsService{
    return [TyphoonDefinition withClass:[AWADCitySuggestServiceImpl class] configuration:^(TyphoonDefinition *definition) {

        [definition injectProperty:@selector(repository) with:[self citySuggestsRepository]];
    }];
}


-(id<AWADSearchRepository>)searchRepository{
    return [TyphoonDefinition withClass:[AWADSearchRepositoryImpl class] configuration:^(TyphoonDefinition *definition) {
        
        [definition useInitializer:@selector(initWithBaseUrl:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:TyphoonConfig(@"search_request_Base_Url")];
            definition.scope = TyphoonScopeLazySingleton;
        }];
    }];
}


-(id<AWADSearchService>)searchService{
    return [TyphoonDefinition withClass:[AWADSearchServiceImpl class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(repository) with:[self searchRepository]];
    }];
}

-(id<AWADTicketsService>)ticketsService{
    return [TyphoonDefinition withClass:[AWADTicketsServiceImpl class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(repository) with:[self ticketsRepository]];
        [definition injectProperty:@selector(requestStateRepository) with:[self ticketsRequestStateRepository]];
    }];
}
-(id<AWADTicketsRepository>)ticketsRepository{
   
    return [TyphoonDefinition withClass:[AWADTicketsRepositoryImpl class] configuration:^(TyphoonDefinition *definition) {
        
        [definition useInitializer:@selector(initWithBaseUrl:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:TyphoonConfig(@"tickets_service_Base_Url")];
        }];
    }];
}

-(id<AWADTicketsRequestStateRepository>)ticketsRequestStateRepository{
    
    return [TyphoonDefinition withClass:[AWADTicketsRequestStateRepositoryImpl class] configuration:^(TyphoonDefinition *definition) {
        
        [definition useInitializer:@selector(initWithBaseUrl:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:TyphoonConfig(@"tickets_service_state_Base_Url")];
        }];
    }];
}

@end

