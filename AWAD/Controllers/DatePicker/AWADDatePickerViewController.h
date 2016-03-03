//
//  AWADDatePickerViewController.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWADDatePickerView.h"
#import "AWADDatePickerPresenter.h"

@interface AWADDatePickerViewController : UIViewController<AWADDatePickerView>


@property(nonatomic, strong) AWADDatePickerPresenter *presenter;

@end
