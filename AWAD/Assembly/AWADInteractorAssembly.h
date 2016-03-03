//
//  AWADInteractionAssembly.h
//  AWAD
//
//  Created by user on 01.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import  <Typhoon/Typhoon.h>
#import "AWADStartPageIO.h"
#import "AWADResultIO.h"



@class AWADPresenterAssembly;
@class AWADDALAssembly;
@interface AWADInteractorAssembly : TyphoonAssembly

@property (nonatomic,strong,readonly) AWADPresenterAssembly *presenterAssembly;
@property (nonatomic,strong,readonly) AWADDALAssembly *dalAssembly;


-(id<AWADStartPageInput>)startPageInteractor;

-(id<AWADResultInput>)resultInteractor;

@end
