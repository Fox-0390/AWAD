//
//  AWADTicketsService.h
//  AWAD
//
//  Created by user on 03.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#ifndef AWADTicketsService_h
#define AWADTicketsService_h

#import <PromiseKit/PromiseKit.h>
typedef void (^percentage)(double currentPercent);
@protocol AWADTicketsService 

- (PMKPromise *)ticketsForString:(NSString *)text percentage:(percentage) percent;



@end

#endif /* AWADTicketsService_h */
