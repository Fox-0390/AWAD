//
//  AWADDatePickerPresenter.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADRouter.h"
#import "AWADDatePickerView.h"
#import "AWADDatePickerIO.h"
@interface AWADDatePickerPresenter : NSObject<AWADDatePickerOutput>

@property (nonatomic, strong) id<AWADRouter> router;
@property (nonatomic, weak) id<AWADDatePickerView> view;
@property (nonatomic, strong) id<AWADDatePickerInput> interactor;

- (void) valueChanged:(NSDate*) date;
- (void) updateView;
- (void) cancelButtonTap;
@end
