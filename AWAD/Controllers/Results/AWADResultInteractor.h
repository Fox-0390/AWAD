//
//  AWADResultInteractor.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADResultProtocol.h"
#import "AWADResultIO.h"
#import "AWADSearchIO.h"
#import "AWADSearchService.h"
#import "AWADTicketsService.h"
@interface AWADResultInteractor : NSObject<AWADResultInput,AWADSearchInput>

@property (nonatomic, weak) id<AWADResultProtocol> delegate;

@property (nonatomic, strong) id<AWADSearchOutput> searchPresenter;
@property (nonatomic, strong) id<AWADResultOutput> resultPresenter;

@property (nonatomic, strong) id<AWADSearchService> searchService;
@property (nonatomic, strong) id<AWADTicketsService> ticketsService;
@end
