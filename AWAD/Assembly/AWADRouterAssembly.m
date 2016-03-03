//
//  AWADRouterAssembly.m
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADRouterAssembly.h"
#import "AWADRouterImpl.h"

@implementation AWADRouterAssembly

- (id)config {
    return [TyphoonDefinition withConfigName:@"Configuration.plist"];
}


-(id<AWADRouter>)awadRouter{
   return [TyphoonDefinition withClass:[AWADRouterImpl class] configuration:^(TyphoonDefinition *definition) {
       [definition useInitializer:@selector(initWithFlowAssembly:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:self.flowAssembly];
        }];
    }];
}



@end
