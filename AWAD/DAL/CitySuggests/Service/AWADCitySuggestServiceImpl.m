//
//  AWADCitySuggestServiceImpl.m
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADCitySuggestServiceImpl.h"

@implementation AWADCitySuggestServiceImpl


-(PMKPromise *)suggestCityForText:(NSString *)text{
    return  [self.repository suggestCityForText:text];
}

@end
