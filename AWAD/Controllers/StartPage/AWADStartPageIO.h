//
//  AWADStartPageIO.h
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//
@class AWADUserInputModel;

@protocol AWADStartPageInput <NSObject>
- (void)updateValues;
- (void)changeText:(NSString*)text isArrivalText:(BOOL)isArrivalText;



@end

@protocol AWADStartPageOutput <NSObject>

- (void)updateView;
- (void)showDatePickerTap;
- (void)updatePosibility:(BOOL)isAvailableSearch;


- (void)setTextArrival:(NSString*)text;
- (void)setTextDestination:(NSString*)text;

- (void)changeTextArrival:(NSString*)text;
- (void)changeTextDestination:(NSString*)text;

@end

