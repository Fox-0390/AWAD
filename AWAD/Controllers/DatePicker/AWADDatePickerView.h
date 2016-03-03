//
//  AWADDatePickerView.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//


@protocol AWADDatePickerView <NSObject>

- (void) setMinimumDate:(NSDate *)date;
- (void) setMaximumDate:(NSDate *)date;

@end