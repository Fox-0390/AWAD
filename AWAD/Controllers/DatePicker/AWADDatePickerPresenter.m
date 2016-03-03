//
//  AWADDatePickerPresenter.m
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADDatePickerPresenter.h"

@implementation AWADDatePickerPresenter

-(void)updateView{
    [self.view setMinimumDate:[NSDate date]];
    [self.view setMaximumDate:[[NSDate date] dateByAddingTimeInterval:60*60*24*365]];
}

- (void)valueChanged:(NSDate *)date{
    [self.interactor setDate:date];
}

- (void)cancelButtonTap{
    [self.router routeURL:[NSURL URLWithString:@"/datePicker/"] withParams:@{
                                                                             @"action":@"hide",kAWADRouterSourceViewControllerParameterKey:self.view}];
}

#pragma mark - AWADDatePickerOutput

- (void)setCurrentDate:(NSDate *)date{
    
}
@end
