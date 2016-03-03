//
//  AWADSearchViewController.h
//  AWAD
//
//  Created by user on 01.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWADSearchView.h"
#import "AWADSearchPresenter.h"

@interface AWADSearchViewController : UIViewController<AWADSearchView>

@property (nonatomic, strong) AWADSearchPresenter *presenter;

@end
