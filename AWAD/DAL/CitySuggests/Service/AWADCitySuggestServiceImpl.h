//
//  AWADCitySuggestServiceImpl.h
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADCitySuggestRepository.h"
#import "AWADCitySuggestService.h"

@interface AWADCitySuggestServiceImpl : NSObject<AWADCitySuggestService>

@property(nonatomic, strong) id<AWADCitySuggestRepository> repository;


@end
