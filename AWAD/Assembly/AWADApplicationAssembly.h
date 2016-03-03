//
//  AWADApplicationAssembly.h
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//


#import "AWADDALAssembly.h"

@class AWADRouterAssembly;


@class AppDelegate;
@class AWADRootViewController;
@class AWADStartPageViewController;

@class AWADPresenterAssembly;
@class AWADInteractorAssembly;

@interface AWADApplicationAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) AWADRouterAssembly *routerAssembly;
@property (nonatomic, strong, readonly) AWADInteractorAssembly *interactionAssembly;
@property (nonatomic, strong, readonly) AWADPresenterAssembly *presenterAssembly;
- (AppDelegate *)appDelegate;

-(AWADRootViewController*)rootViewController;
-(AWADStartPageViewController *)startPageViewController;
@end
