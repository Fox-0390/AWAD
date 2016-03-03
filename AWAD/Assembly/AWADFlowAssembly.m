//
//  AWADFlowAssembly.m
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADFlowAssembly.h"
#import "AWADFlowController.h"
#import "AWADRouterAssembly.h"
@implementation AWADFlowAssembly

- (id)config {
    return [TyphoonDefinition withConfigName:@"Configuration.plist"];
}


-(AWADFlowController *)flowController{
    return [TyphoonDefinition withClass:[AWADFlowController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(router) with:[self.routerAssembly awadRouter]];
        [definition injectProperty:@selector(storyboard) with:[self storyboard]];
    }];
}

-(UIStoryboard*)storyboard{
    return [TyphoonDefinition withClass:[TyphoonStoryboard class] configuration:^(TyphoonDefinition *definition) {
                    [definition useInitializer:@selector(storyboardWithName:factory:bundle:) parameters:^(TyphoonMethod *initializer) {
                        NSBundle *bundle = [NSBundle mainBundle];
                        NSString *storyboardName =  TyphoonConfig(@"storyboard_name_iPhone");
                        [initializer injectParameterWith:storyboardName];
                        [initializer injectParameterWith:self];
                        [initializer injectParameterWith:bundle];
                    }];
                }];
            }

@end
