//
//  AWADSuggestsViewController.h
//  AWAD
//
//  Created by user on 01.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWADSuggestsPresenter.h"
#import "AWADSuggestsView.h"
@interface AWADSuggestsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,AWADSuggestsView>

@property(nonatomic, strong) AWADSuggestsPresenter *presenter;

@end
