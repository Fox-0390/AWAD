//
//  AWADResultViewController.m
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADResultViewController.h"

@implementation AWADResultViewController

-(void)viewDidLoad{
    self.presenter.view = self;
    [super viewDidLoad];
    [self.presenter updateView];
}

#pragma mark - AWADResultView


@end
