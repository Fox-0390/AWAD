//
//  AWADFlowController.m
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADFlowController.h"

static NSString* const kAWADStartPageViewController = @"startPageId";
static NSString* const kAWADStartPageSuggestsViewController = @"suggestsVCId";
static NSString* const kAWADStartPageDatePickerViewController = @"datePickerVCId";
static NSString* const kAWADSearchPageViewController = @"searchPageVCId";
@implementation AWADFlowController



-(void)showStartPageWithSourceViewController:(UIViewController *)sourceViewController
                                      inView:(UIView *)view{
    
    UIViewController* sourceVC = sourceViewController;
    UIViewController* destVC = [self.storyboard instantiateViewControllerWithIdentifier:kAWADStartPageViewController];
    
    UIView *sourceView = view;
    UIView *destView = destVC.view;
    
    [sourceVC addChildViewController:destVC];
    [sourceView addSubview:destVC.view];
    [destView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSMutableArray *constraints = [NSMutableArray new];
    NSDictionary *views = @{@"view":destView};
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:views]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:views]];
    [sourceView addConstraints:constraints];
    
    [destVC didMoveToParentViewController:sourceVC];
    
    
}

- (void)showSuggestsWithSourceController:(UIViewController*) sourceViewController
                                  inView:(UIView*)view
                           {
                            
     view.hidden = NO;
    if ([[view subviews] count]>0)return;
        

    UIViewController* sourceVC = sourceViewController;
    UIViewController* destVC = [self.storyboard instantiateViewControllerWithIdentifier:kAWADStartPageSuggestsViewController];
    
    UIView *sourceView = view;
    UIView *destView = destVC.view;
        [sourceView addSubview:destVC.view];
    [destView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSMutableArray *constraints = [NSMutableArray new];
    NSDictionary *views = @{@"view":destView};
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:views]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:views]];
    [sourceView addConstraints:constraints];
    
    [destVC didMoveToParentViewController:sourceVC];

}

- (void)hideSuggestsAndRemoveFromSourceController:(UIViewController*)suggestsViewController
                              sourceVieController:(UIViewController*)   sourceViewController
                                           inView:(UIView*)view{
    
    view.hidden = YES;
}

-(void)showDatePickerPresentedViewController:(UIViewController *)sourceViewController{
    
     UIViewController* destVC = [self.storyboard instantiateViewControllerWithIdentifier:kAWADStartPageDatePickerViewController];
   
    destVC.providesPresentationContextTransitionStyle = YES;
    destVC.definesPresentationContext = YES;
    [destVC setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    destVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [sourceViewController presentViewController:destVC animated:YES completion:nil];
    destVC.view.superview.frame = CGRectMake(0, 0, 540, 620);
    destVC.view.superview.center = sourceViewController.view.center;
    
}


- (void)dismissDatePicker:(UIViewController *)sourceViewController{
    [sourceViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)showSearchPage:(UIViewController*)sourceViewController{
    UINavigationController* navVC = [self.storyboard instantiateViewControllerWithIdentifier:kAWADStartPageViewController];
    
    UIViewController* destVC = [self.storyboard instantiateViewControllerWithIdentifier:kAWADSearchPageViewController];
//    [destVC didMoveToParentViewController:navVC];
//    [navVC.topViewController presentViewController:destVC animated:YES completion:nil];
//    [navVC showViewController:destVC sender:self];
}
@end
