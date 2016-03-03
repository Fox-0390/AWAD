//
//  AWADRouter.h
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//


#ifndef AWADRouter_h
#define AWADRouter_h

static NSString *const kAWADRouterURLRequestParameterKey = @"AWADRouter_URLRequest";
static NSString *const kAWADRouterContainerViewParameterKey = @"AWADRouter_ContainerView";
static NSString *const kAWADRouterSourceViewControllerParameterKey = @"AWAD_SourceViewController";
static NSString *const kAWADRouterPresenterSourceViewControllerParameterKey = @"AWAD_PresenterSourceViewController";
static NSString *const kAWADRouterSecondViewControllerParameterKey = @"AWAD_SecondSourceViewController";
@protocol AWADRouter <NSObject>

-(BOOL)routeURL:(NSURL *)URL;
-(BOOL)routeURL:(NSURL *)URL withParams:(NSDictionary *)params;

@end


#endif /* AWADRouter_h */
