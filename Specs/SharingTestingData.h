//
//  SharingTestingData.h
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADTestDALAssembly.h"
@interface SharingTestingData : NSObject
@property (nonatomic, readonly) AWADTestDALAssembly *testDALAssembly;
+ (id)sharedInstance;
@end
