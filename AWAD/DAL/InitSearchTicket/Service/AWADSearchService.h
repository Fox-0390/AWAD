//
//  AWADSearchService.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#ifndef AWADSearchService_h
#define AWADSearchService_h
#import <PromiseKit/PromiseKit.h>

@protocol AWADSearchService <NSObject>

- (PMKPromise *)searchForText:(NSString *)text;

@end

#endif /* AWADSearchService_h */
