//
//  AWADTicketsService.h
//  AWAD
//
//  Created by user on 03.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#ifndef AWADTicketsService_h
#define AWADTicketsService_h
#import "AWADTicketsRequestStateRepository.h"
#import <PromiseKit/PromiseKit.h>

@protocol AWADTicketsService 

-(PMKPromise *)ticketsForString:(NSString *)text callBackPercent:(percentCallback) callback;



@end

#endif /* AWADTicketsService_h */
