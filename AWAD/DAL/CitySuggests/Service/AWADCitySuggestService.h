//
//  AWADCityService.h
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#ifndef AWADCityService_h
#define AWADCityService_h

#import <PromiseKit/PromiseKit.h>

@protocol AWADCitySuggestService

- (PMKPromise *)suggestCityForText:(NSString *)text;

@end

#endif /* AWADCityService_h */
