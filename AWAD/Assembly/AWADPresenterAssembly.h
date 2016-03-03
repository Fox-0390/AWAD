//
//  AWADPresenterAssembly.h
//  AWAD
//
//  Created by user on 01.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import  <Typhoon/Typhoon.h>
#import "AWADStartPageIO.h"
#import "AWADSuggestsIO.h"
#import "AWADDatePickerIO.h"
#import "AWADResultIO.h"
#import "AWADSearchIO.h"

@class AWADInteractorAssembly;
@class AWADRouterAssembly;

@interface AWADPresenterAssembly : TyphoonAssembly

@property(nonatomic,strong,readonly) AWADInteractorAssembly* interactorAssembly;
@property(nonatomic,strong,readonly) AWADRouterAssembly* routerAssembly;

-(id<AWADStartPageOutput>)startPagePresenter;
-(id<AWADSuggestsOutput>)suggestsPresenter;
-(id<AWADDatePickerOutput>)datePickerPresenter;
-(id<AWADSearchOutput>)searchPresenter;
-(id<AWADResultOutput>)resultPresenter;
@end
