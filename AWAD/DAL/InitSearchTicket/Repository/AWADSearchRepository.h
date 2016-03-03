//
//  AWADSearchRepository.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#ifndef AWADSearchRepository_h
#define AWADSearchRepository_h
#import <PromiseKit/PromiseKit.h>

@protocol AWADSearchRepository <NSObject>

- (PMKPromise *)searchForText:(NSString *)text;

@end

#endif /* AWADSearchRepository_h */
