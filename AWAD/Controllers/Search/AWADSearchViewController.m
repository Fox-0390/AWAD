//
//  AWADSearchViewController.m
//  AWAD
//
//  Created by user on 01.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADSearchViewController.h"

@interface AWADSearchViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (weak, nonatomic) IBOutlet UILabel *processLabel;

@end

@implementation AWADSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.progressView setProgress:0.0];
    self.presenter.view = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - AWADSearchView
-(void)setProgressValue:(double)value{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.progressView setProgress:value/100 animated:YES];
        [self.processLabel setText:[NSString stringWithFormat:@"%.2f%",value]];

    });
}

@end
