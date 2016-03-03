//
//  AWADSearchPresenter.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADSearchIO.h"
#import "AWADSearchView.h"
#import "AWADRouter.h"
@interface AWADSearchPresenter : NSObject<AWADSearchOutput>

@property (nonatomic,strong) id<AWADRouter> router;
@property (nonatomic, strong) id<AWADSearchInput> interactor;
@property (nonatomic, weak) id<AWADSearchView> view;
@end
