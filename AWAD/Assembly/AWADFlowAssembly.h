//
//  AWADFlowAssembly.h
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@class AWADRouterAssembly;

@class AWADFlowController;

@interface AWADFlowAssembly : TyphoonAssembly

@property(nonatomic,strong,readonly) AWADRouterAssembly* routerAssembly;

-(AWADFlowController*)flowController;



@end
