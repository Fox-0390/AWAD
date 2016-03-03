//
//  AWADStartPage.h
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//

@protocol AWADStartPageView <NSObject>

- (void)setAvailableSearch:(BOOL)isAvailable;

- (void)setTextArrival:(NSString*)text;
- (void)setTextDestination:(NSString*)text;

- (void)resignFirstResponderArrivalTextField;
- (void)resignFirstResponderDestinationTextField;

@property (nonatomic) IBOutlet UIView* suggestsContainer;

@end
