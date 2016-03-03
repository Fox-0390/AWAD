//
//  AWADTicketsRequestStateRepository.h
//  AWAD
//
//  Created by user on 03.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#ifndef AWADTicketsRequestStateRepository_h
#define AWADTicketsRequestStateRepository_h
#import <PromiseKit/PromiseKit.h>

@protocol AWADTicketsRequestStateRepository 

- (PMKPromise *)ticketRequestState:(NSString *)text;

@end

#endif /* AWADTicketsRequestStateRepository_h */
