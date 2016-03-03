//
//  AWADSuggestsPresenter.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADSuggestsIO.h"
#import "AWADSuggestsView.h"
@interface AWADSuggestsPresenter : NSObject<AWADSuggestsOutput>

@property(nonatomic,strong) id<AWADSuggestsInput> interactor;

@property (nonatomic,strong) id<AWADSuggestsView> suggestsView;


- (void)selectSuggest:(NSIndexPath*)index;

@end
