//
//  AWADRootViewController.m
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADRootViewController.h"

@interface AWADRootViewController ()
@property (nonatomic, strong) IBOutlet UIView* contentView;
@end

@implementation AWADRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [self.router routeURL:[NSURL URLWithString:@"/startPage/"] withParams:@{
                                                                            @"action":@"show",kAWADRouterSourceViewControllerParameterKey:self,
                                                                            kAWADRouterContainerViewParameterKey:self.contentView}];
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
