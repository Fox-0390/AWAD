//
//  AWADCitySuggestRepository.h
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#ifndef AWADCitySuggestRepository_h
#define AWADCitySuggestRepository_h

#import <PromiseKit/PromiseKit.h>

@protocol AWADCitySuggestRepository

- (PMKPromise *)suggestCityForText:(NSString *)text;

@end

#endif /* AWADCitySuggestRepository_h */
