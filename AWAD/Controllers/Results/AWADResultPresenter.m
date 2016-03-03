//
//  AWADResultPresenter.m
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADResultPresenter.h"

@implementation AWADResultPresenter

-(void)updateView{
    [self.interactor updateView];
}


#pragma mark - 
-(void)updateCollection:(NSArray *)arr{
    [self.view updateDataSource:arr];
}

-(void)showProgressView{
    
    [self.router routeURL:[NSURL URLWithString:@"/showProgressView/"] withParams:@{
                                                                             @"action":@"show",kAWADRouterSourceViewControllerParameterKey:self.view,
                                                                             kAWADRouterContainerViewParameterKey:self.view.containerView}];
}

- (void)hideSearchView{
    [self.router routeURL:[NSURL URLWithString:@"/showProgressView/"] withParams:@{
                                                                                   @"action":@"hide",kAWADRouterSourceViewControllerParameterKey:self.view,
                                                                                   kAWADRouterContainerViewParameterKey:self.view.containerView}];
}


@end
