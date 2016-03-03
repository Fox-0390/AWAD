//
//  AWADSuggestsIO.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#ifndef AWADSuggestsIO_h
#define AWADSuggestsIO_h

@protocol AWADSuggestsInput <NSObject>

-(void)suggestsDidSelect:(NSIndexPath*)index;

@end

@protocol AWADSuggestsOutput <NSObject>

-(void)updateSuggests:(NSArray*)suggestsArray;

@end

#endif /* AWADSuggestsIO_h */
