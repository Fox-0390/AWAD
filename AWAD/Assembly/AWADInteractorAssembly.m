//
//  AWADInteractionAssembly.m
//  AWAD
//
//  Created by user on 01.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADInteractorAssembly.h"
#import "AWADPresenterAssembly.h"
#import "AWADDALAssembly.h"

#import "AWADStartPageInteractor.h"
#import "AWADResultInteractor.h"

@implementation AWADInteractorAssembly

- (id)config {
    return [TyphoonDefinition withConfigName:@"Configuration.plist"];
}



-(id<AWADStartPageInput>)startPageInteractor{
    return [TyphoonDefinition withClass:[AWADStartPageInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(startPagePresenter) with:[self.presenterAssembly  startPagePresenter]];
        [definition injectProperty:@selector(suggestsPresenter) with:[self.presenterAssembly
                                                                      suggestsPresenter]];
        [definition injectProperty:@selector(datePickerPresenter) with:[self.presenterAssembly  datePickerPresenter]];
        
        [definition injectProperty:@selector(suggestsService) with:[self.dalAssembly  citySuggestsService]];

        [definition injectProperty:@selector(suggestsService) with:[self.dalAssembly  citySuggestsService]];
        
        definition.scope = TyphoonScopeLazySingleton;
   
    }];
}
-(id<AWADSearchInput>)resultInteractor{
    return [TyphoonDefinition withClass:[AWADResultInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(delegate) with:[self startPageInteractor]];
        [definition injectProperty:@selector(resultPresenter) with:[self.presenterAssembly resultPresenter]];
        [definition injectProperty:@selector(searchPresenter) with:[self.presenterAssembly searchPresenter]];
        [definition injectProperty:@selector(searchService) with:[self.dalAssembly searchService]];
        [definition injectProperty:@selector(ticketsService) with:[self.dalAssembly ticketsService]];
     }];
}

@end
