//
//  AWADStartPagePresenter.m
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADStartPagePresenter.h"
#import "AWADUserInputModel.h"
@implementation AWADStartPagePresenter


-(void)updateView{
    [self.interactor updateValues];
}

-(void)updatePosibility:(BOOL)isAvailableSearch{
    [self.view setAvailableSearch:isAvailableSearch];
}


-(void)changeTextArrival:(NSString *)text{
    [self.interactor changeText:text isArrivalText:YES];
    text.length>1?[self _showSuggests]:[self _hideSuggests];
}

-(void)changeTextDestination:(NSString *)text{
    [self.interactor changeText:text isArrivalText:NO];
    text.length>1?[self _showSuggests]:[self _hideSuggests];
}

- (void)setTextArrival:(NSString*)text{
    [self.view setTextArrival:text];
    [self _hideSuggests];
    [self.view resignFirstResponderArrivalTextField];
}
- (void)setTextDestination:(NSString*)text{
    [self.view setTextDestination:text];
    [self _hideSuggests];
    [self.view resignFirstResponderDestinationTextField];
}


- (void)showDatePickerTap{
    [self _showDatePicker];
}

-(void)searchButtonTap{
    [self.router routeURL:[NSURL URLWithString:@"/searchPage/"] withParams:@{
                                                                             @"action":@"show",kAWADRouterSourceViewControllerParameterKey:self.view}];
}

#pragma mark - Helpers

- (void)_showDatePicker{
    [self.router routeURL:[NSURL URLWithString:@"/datePicker/"] withParams:@{
                                                              @"action":@"show",kAWADRouterSourceViewControllerParameterKey:self.view}];
}

- (void)_showSuggests{
    [self.router routeURL:[NSURL URLWithString:@"/suggests/"] withParams:@{
                                                                           @"action":@"show",kAWADRouterSourceViewControllerParameterKey:self.view,
                                                                           kAWADRouterContainerViewParameterKey:self.view.suggestsContainer,
                                                                           kAWADRouterPresenterSourceViewControllerParameterKey:self}];
}

- (void)_hideSuggests{
    [self.router routeURL:[NSURL URLWithString:@"/suggests/"] withParams:@{
                                                                           @"action":@"hide",
                                                                           kAWADRouterSourceViewControllerParameterKey:self.view,
                                                                           kAWADRouterContainerViewParameterKey:self.view.suggestsContainer,
                                                                           kAWADRouterPresenterSourceViewControllerParameterKey:self}];
}

@end
