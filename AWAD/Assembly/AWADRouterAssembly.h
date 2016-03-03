//
//  AWADRouterAssembly.h
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import "AWADRouter.h"

@class AWADFlowAssembly;

@interface AWADRouterAssembly : TyphoonAssembly

@property (nonatomic, strong) AWADFlowAssembly* flowAssembly;

-(id<AWADRouter>)awadRouter;

@end
