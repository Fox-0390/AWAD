//
//  AWADStartPagePresenter.h
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADStartPageView.h"
#import "AWADStartPageIO.h"
#import "AWADRouter.h"

@interface AWADStartPagePresenter : NSObject<AWADStartPageOutput>

@property (nonatomic, strong) id<AWADRouter> router;
@property (nonatomic, weak) id<AWADStartPageView> view;
@property (nonatomic, strong) id<AWADStartPageInput> interactor;

- (void)showDatePickerTap;
- (void)searchButtonTap;

@end
