//
//  AWADDatePickerViewController.m
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADDatePickerViewController.h"

@interface AWADDatePickerViewController()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, weak) IBOutlet UIButton* doneButton;
@property (nonatomic, weak) IBOutlet UIButton* cancelButton;
@property (nonatomic, weak) IBOutlet UILabel* titleLabel;
- (IBAction)doneAction:(id)sender;
- (IBAction)cancelAction:(id)sender;


@end

@implementation AWADDatePickerViewController


-(void)viewDidLoad{
    
    [super viewDidLoad];
    self.presenter.view = self;
    [self.titleLabel setText:NSLocalizedString(@"choose date", nil)];
    [self.doneButton setTitle:@"Готово" forState:UIControlStateNormal];
    [self.cancelButton setTitle:@"Отмена" forState:UIControlStateNormal];
    [self.presenter updateView];
}

#pragma mark - Actions

-(void)doneAction:(id)sender{
    [self.presenter valueChanged:[self.datePicker date]];
    [self.presenter cancelButtonTap];
}
-(void)cancelAction:(id)sender{
    [self.presenter cancelButtonTap];
}
#pragma mark - AWADDatePickerView

- (void)setMinimumDate:(NSDate *)date{
    self.datePicker.minimumDate = date;
}

- (void)setMaximumDate:(NSDate *)date{
    self.datePicker.maximumDate = date;
}

@end
