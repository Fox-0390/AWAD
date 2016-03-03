//
//  AWADTicketsRequestStateRepositoryImpl.h
//  AWAD
//
//  Created by user on 03.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADTicketsRequestStateRepository.h"
@interface AWADTicketsRequestStateRepositoryImpl : NSObject<AWADTicketsRequestStateRepository>

-(instancetype)initWithBaseUrl:(NSString *)baseUrl;
@end
