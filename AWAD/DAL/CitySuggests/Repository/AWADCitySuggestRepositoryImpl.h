//
//  AWADCitySuggestRepositoryImpl.h
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADCitySuggestRepository.h"
@interface AWADCitySuggestRepositoryImpl : NSObject<AWADCitySuggestRepository>

-(instancetype) initWithBaseUrl:(NSString*) baseUrl;

@end
