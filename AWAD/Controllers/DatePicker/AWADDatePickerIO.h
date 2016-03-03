//
//  AWADDatePickerIO.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//


@protocol AWADDatePickerInput <NSObject>

- (void)setDate:(NSDate *)date;

@end

@protocol AWADDatePickerOutput <NSObject>

- (void)setCurrentDate:(NSDate *)date;

@end