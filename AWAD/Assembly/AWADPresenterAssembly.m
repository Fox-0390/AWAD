//
//  AWADPresenterAssembly.m
//  AWAD
//
//  Created by user on 01.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADPresenterAssembly.h"
#import "AWADStartPagePresenter.h"
#import "AWADSuggestsPresenter.h"
#import "AWADDatePickerPresenter.h"
#import "AWADSearchPresenter.h"
#import "AWADResultPresenter.h"


#import "AWADInteractorAssembly.h"
#import "AWADRouterAssembly.h"

@implementation AWADPresenterAssembly


- (id)config {
    return [TyphoonDefinition withConfigName:@"Configuration.plist"];
}


-(id<AWADStartPageOutput>)startPagePresenter{
    return [TyphoonDefinition withClass:[AWADStartPagePresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(interactor) with:[self.interactorAssembly startPageInteractor]];
        [definition injectProperty:@selector(router) with:[self.routerAssembly awadRouter]];
    }];
}

-(id<AWADSuggestsOutput>)suggestsPresenter{
    return [TyphoonDefinition withClass:[AWADSuggestsPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(interactor) with:[self.interactorAssembly startPageInteractor]];
        definition.scope = TyphoonScopeLazySingleton;
    }];
}

-(id<AWADDatePickerOutput>)datePickerPresenter{
    return [TyphoonDefinition withClass:[AWADDatePickerPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(interactor) with:[self.interactorAssembly startPageInteractor]];
        [definition injectProperty:@selector(router) with:[self.routerAssembly awadRouter]];
        definition.scope = TyphoonScopeLazySingleton;
    }];
}

-(id<AWADResultOutput>)resultPresenter{
    return [TyphoonDefinition withClass:[AWADResultPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(interactor) with:[self.interactorAssembly resultInteractor]];
//        [definition injectProperty:@selector(router) with:[self.routerAssembly awadRouter]];
//        definition.scope = TyphoonScopeLazySingleton;
    }];
}

-(id<AWADSearchOutput>)searchPresenter{
    return [TyphoonDefinition withClass:[AWADSearchPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(interactor) with:[self.interactorAssembly resultInteractor]];
        //        [definition injectProperty:@selector(router) with:[self.routerAssembly awadRouter]];
        //        definition.scope = TyphoonScopeLazySingleton;
    }];

}

@end
