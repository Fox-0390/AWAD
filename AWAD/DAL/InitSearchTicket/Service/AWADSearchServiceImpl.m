//
//  AWADSearchServiceImpl.m
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADSearchServiceImpl.h"

@interface AWADSearchServiceImpl()


@end

@implementation AWADSearchServiceImpl




-(PMKPromise *)searchForText:(NSString *)text {
    return [self.repository searchForText:text];
}



@end
