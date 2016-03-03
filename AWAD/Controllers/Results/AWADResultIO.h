//
//  AWADResultIO.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#ifndef AWADResultIO_h
#define AWADResultIO_h


@protocol AWADResultInput <NSObject>

- (void) updateView;

@end

@protocol AWADResultOutput <NSObject>

- (void) updateCollection:(NSArray*)arr;
- (void) showProgressView;
- (void)hideSearchView;
@end

#endif /* AWADResultIO_h */
