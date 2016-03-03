//
//  AWADApplicationAssembly.m
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADApplicationAssembly.h"
#import "AWADRouterAssembly.h"
#import "AWADInteractorAssembly.h"
#import "AWADPresenterAssembly.h"

#import "AppDelegate.h"
#import "AWADRootViewController.h"
#import "AWADStartPageViewController.h"
#import "AWADSuggestsViewController.h"
#import "AWADDatePickerViewController.h"
#import "AWADSearchViewController.h"
#import "AWADResultViewController.h"

@implementation AWADApplicationAssembly

- (id)config {
    return [TyphoonDefinition withConfigName:@"Configuration.plist"];
}




-(AppDelegate *)appDelegate{
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition) {
    }];
}


-(AWADRootViewController *)rootViewController{
    return [TyphoonDefinition withClass:[AWADRootViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(router) with:[self.routerAssembly awadRouter]];
    }];
}

-(AWADStartPageViewController *)startPageViewController{
    return [TyphoonDefinition withClass:[AWADStartPageViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self.presenterAssembly startPagePresenter]];
    }];

}

-(AWADSuggestsViewController *)suggestsViewController{
    return [TyphoonDefinition withClass:[AWADSuggestsViewController class] configuration:^(TyphoonDefinition *definition) {
        
        [definition injectProperty:@selector(presenter) with:[self.presenterAssembly suggestsPresenter]];
       
    }];
    
}

-(AWADDatePickerViewController *)datePickerViewController{
    return [TyphoonDefinition withClass:[AWADDatePickerViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self.presenterAssembly datePickerPresenter]];
    }];
    
}

-(AWADSearchViewController *)searchViewController{
    return [TyphoonDefinition withClass:[AWADSearchViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self.presenterAssembly searchPresenter]];
    }];
    
}

-(AWADResultViewController *)resultViewController{
    return [TyphoonDefinition withClass:[AWADResultViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self.presenterAssembly resultPresenter]];
    }];
    
}

@end
