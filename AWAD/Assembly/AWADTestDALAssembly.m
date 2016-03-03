//
//  AWADTestDALAssembly.m
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADTestDALAssembly.h"

@implementation AWADTestDALAssembly

- (id)config {
    return [TyphoonDefinition withConfigName:@"TestConfiguration.plist"];
}

@end
