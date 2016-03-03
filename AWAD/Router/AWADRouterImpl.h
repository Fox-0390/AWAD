//
//  AWADRouterImpl.h
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADRouter.h"
#import <JLRoutes/JLRoutes.h>

@class AWADFlowAssembly;

@interface AWADRouterImpl : NSObject<AWADRouter>

@property (nonatomic, strong) AWADFlowAssembly *flowAssembly;

-(instancetype)initWithFlowAssembly:(AWADFlowAssembly*)flowAssembly;

@end
