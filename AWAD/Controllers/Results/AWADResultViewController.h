//
//  AWADResultViewController.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWADResultPresenter.h"
#import "AWADResultView.h"
@interface AWADResultViewController : UIViewController<AWADResultView>

@property (nonatomic, strong) AWADResultPresenter* presenter;

@end
