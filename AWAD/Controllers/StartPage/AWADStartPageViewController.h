//
//  StartPageViewController.h
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWADStartPageView.h"
#import "AWADStartPagePresenter.h"
@interface AWADStartPageViewController : UIViewController<AWADStartPageView,UITextFieldDelegate>

@property(nonatomic,strong) AWADStartPagePresenter* presenter;

@end

