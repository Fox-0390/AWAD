//
//  AWADSearchPresenter.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADSearchIO.h"


@interface AWADSearchPresenter : NSObject<AWADSearchOutput>

@property (nonatomic, strong) id<AWADSearchInput> interactor;

@end
