//
//  AWADRootViewController.h
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADRouter.h"

@interface AWADRootViewController : UIViewController

@property (nonatomic, strong) id<AWADRouter> router;

@end
