//
//  AWADStartPageInteractor.h
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADStartPageIO.h"
#import "AWADSuggestsIO.h"
#import "AWADCitySuggestService.h"
#import "AWADDatePickerIO.h"
#import "AWADResultProtocol.h"
@interface AWADStartPageInteractor : NSObject<AWADStartPageInput,AWADSuggestsInput,AWADDatePickerInput,AWADResultProtocol>

@property (nonatomic, strong) id<AWADStartPageOutput> startPagePresenter;
@property (nonatomic, strong) id<AWADSuggestsOutput> suggestsPresenter;
@property (nonatomic, strong) id<AWADDatePickerOutput> datePickerPresenter;
@property (nonatomic, strong) id<AWADCitySuggestService> suggestsService;
@end
