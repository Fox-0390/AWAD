//
//  AWADSearchServiceImpl.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADSearchService.h"
#import "AWADSearchRepository.h"

@interface AWADSearchServiceImpl : NSObject<AWADSearchService>

@property(nonatomic, strong) id<AWADSearchRepository> repository;

@end
