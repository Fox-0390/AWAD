//
//  AWADDALAssembly.h
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Typhoon/Typhoon.h>

#import "AWADCitySuggestsDAL.h"
#import "AWADSearchDAL.h"
#import "AWADTicketsDAL.h"
@interface AWADDALAssembly : TyphoonAssembly


-(id<AWADCitySuggestService>)citySuggestsService;
-(id<AWADCitySuggestRepository>)citySuggestsRepository;

-(id<AWADSearchService>)searchService;
-(id<AWADSearchRepository>)searchRepository;

-(id<AWADTicketsService>)ticketsService;
-(id<AWADTicketsRepository>)ticketsRepository;
-(id<AWADTicketsRequestStateRepository>)ticketsRequestStateRepository;

@end
