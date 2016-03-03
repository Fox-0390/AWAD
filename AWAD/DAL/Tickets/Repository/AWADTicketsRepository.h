//
//  AWADTicketsRepository.h
//  AWAD
//
//  Created by user on 03.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#ifndef AWADTicketsRepository_h
#define AWADTicketsRepository_h

#import <PromiseKit/PromiseKit.h>

@protocol AWADTicketsRepository

- (PMKPromise *)ticketsForString:(NSString *)text;

@end

#endif /* AWADTicketsRepository_h */
