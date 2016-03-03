//
//  AWADResultPresenter.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADResultIO.h"
#import "AWADResultView.h"
#import "AWADRouter.h"
@interface AWADResultPresenter : NSObject<AWADResultOutput>

@property (nonatomic, strong) id<AWADRouter> router;
@property (nonatomic, strong) id<AWADResultInput> interactor;
@property (nonatomic, weak) id<AWADResultView> view;

- (void) updateView;

@end
