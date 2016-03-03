//
//  AWADFlowController.h
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "AWADRouter.h"

@interface AWADFlowController : NSObject

@property (nonatomic, strong) id<AWADRouter> router;
@property (nonatomic, strong) UIStoryboard *storyboard;

- (void)showStartPageWithSourceViewController:(UIViewController *)sourceViewController inView:(UIView *)view;


- (void)showSuggestsWithSourceController:(UIViewController*) sourceViewController
                                  inView:(UIView*)view;

- (void)hideSuggestsAndRemoveFromSourceController:(UIViewController*)suggestsViewController
                              sourceVieController:(UIViewController*)sourceViewController
                                           inView:(UIView*)view;
                                    
- (void)showDatePickerPresentedViewController:(UIViewController*)sourceViewController;
- (void)dismissDatePicker:(UIViewController*)sourceViewController;

- (void)showSearchPage:(UIViewController*)sourceViewController;

- (void)showProgressView:(UIViewController*)sourceViewController inView:(UIView*)view;
- (void)hideProgressView:(UIViewController*)suggestsViewController
     sourceVieController:(UIViewController*)sourceViewController
                  inView:(UIView*)view;
@end
