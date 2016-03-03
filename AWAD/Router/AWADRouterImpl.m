//
//  AWADRouterImpl.m
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADRouterImpl.h"
#import "AWADFlowAssembly.h"
#import "AWADFlowController.h"

NSString *const kAWADRouterSchemeName = @"awad";



@interface AWADRouterImpl(){
    JLRoutes *_router;
}

@property (nonatomic, strong) AWADFlowController *flowController;

@end

@implementation AWADRouterImpl


-(instancetype)initWithFlowAssembly:(AWADFlowAssembly *)flowAssembly{
    self = [super init];
    if (self) {
        _flowAssembly = flowAssembly;
        [self _configureRouter];
    }
    return self;
}


-(void)_configureRouter{
    _router =  [JLRoutes routesForScheme:kAWADRouterSchemeName];
    __weak typeof(self) __weakSelf = self;
    [_router addRoute:@"/startPage/" handler:^BOOL(NSDictionary *parameters) {
        NSString *action = parameters[@"action"];
        if([action isEqualToString:@"show"]){
            __weakSelf.flowController = [__weakSelf.flowAssembly flowController];
             UIViewController *sourceViewController = parameters[kAWADRouterSourceViewControllerParameterKey];
            UIView * contentView = parameters[kAWADRouterContainerViewParameterKey];
            [__weakSelf.flowController showStartPageWithSourceViewController:sourceViewController inView:contentView];
            
        }
//        __weakSelf
        return YES;
    }];
    [_router addRoute:@"/suggests/" handler:^BOOL(NSDictionary *parameters) {
        NSString *action = parameters[@"action"];
        if([action isEqualToString:@"show"]){
            __weakSelf.flowController = [__weakSelf.flowAssembly flowController];
            UIViewController *sourceViewController = parameters[kAWADRouterSourceViewControllerParameterKey];
            UIView * contentView = parameters[kAWADRouterContainerViewParameterKey];
            [__weakSelf.flowController showSuggestsWithSourceController:sourceViewController inView:contentView];
            
        }
        if([action isEqualToString:@"hide"]){
            __weakSelf.flowController = [__weakSelf.flowAssembly flowController];
            UIViewController *sourceViewController = parameters[kAWADRouterSourceViewControllerParameterKey];
            UIViewController* suggestsVC = parameters[kAWADRouterSecondViewControllerParameterKey];
            UIView * contentView = parameters[kAWADRouterContainerViewParameterKey];
            [__weakSelf.flowController hideSuggestsAndRemoveFromSourceController:suggestsVC sourceVieController:sourceViewController inView:contentView];
            
        }
        return YES;
    }];
    [_router addRoute:@"/datePicker/" handler:^BOOL(NSDictionary *parameters) {
        NSString *action = parameters[@"action"];
        if([action isEqualToString:@"show"]){
            __weakSelf.flowController = [__weakSelf.flowAssembly flowController];
            UIViewController *sourceViewController = parameters[kAWADRouterSourceViewControllerParameterKey];
                [__weakSelf.flowController showDatePickerPresentedViewController:sourceViewController];
            
        }
        if([action isEqualToString:@"hide"]){
            __weakSelf.flowController = [__weakSelf.flowAssembly flowController];
           UIViewController *sourceViewController = parameters[kAWADRouterSourceViewControllerParameterKey];
            [__weakSelf.flowController dismissDatePicker:sourceViewController];
            
        }
        
        //        __weakSelf
        return YES;
    }];
    [_router addRoute:@"/searchPage/" handler:^BOOL(NSDictionary *parameters) {
        NSString *action = parameters[@"action"];
        if([action isEqualToString:@"show"]){
            __weakSelf.flowController = [__weakSelf.flowAssembly flowController];
            UIViewController *sourceViewController = parameters[kAWADRouterSourceViewControllerParameterKey];
            [__weakSelf.flowController showSearchPage:sourceViewController];
            
        }
//        if([action isEqualToString:@"hide"]){
//            __weakSelf.flowController = [__weakSelf.flowAssembly flowController];
//            UIViewController *sourceViewController = parameters[kAWADRouterSourceViewControllerParameterKey];
//            [__weakSelf.flowController dismissDatePicker:sourceViewController];
//            
//        }
        
        return YES;
    }];


}

#pragma mark - AWADRouter

-(BOOL)routeURL:(NSURL *)URL{
    return  [_router routeURL:URL];
}

-(BOOL)routeURL:(NSURL *)URL withParams:(NSDictionary *)params{
    return [_router routeURL:URL withParameters:params];
}
@end
