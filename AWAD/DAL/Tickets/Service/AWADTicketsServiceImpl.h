//
//  AWADTicketsServiceImpl.h
//  AWAD
//
//  Created by user on 03.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADTicketsService.h"
#import "AWADTicketsRepository.h"
#import "AWADTicketsRequestStateRepository.h"


@interface AWADTicketsServiceImpl : NSObject<AWADTicketsService>

@property (nonatomic, strong) id<AWADTicketsRepository> repository;
@property (nonatomic, strong) id<AWADTicketsRequestStateRepository> requestStateRepository;
@end
