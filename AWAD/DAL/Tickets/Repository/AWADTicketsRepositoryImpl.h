//
//  AWADTicketsRepositoryImpl.h
//  AWAD
//
//  Created by user on 03.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADTicketsRepository.h"

@interface AWADTicketsRepositoryImpl : NSObject<AWADTicketsRepository>

-(instancetype)initWithBaseUrl:(NSString *)baseUrl;

@end
