//
//  AWADSearchIO.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#ifndef AWADSearchIO_h
#define AWADSearchIO_h

@protocol AWADSearchInput <NSObject>



@end

@protocol AWADSearchOutput <NSObject>

- (void) presentView;

- (void)setProgress:(double)value;

@end


#endif /* AWADSearchIO_h */
