//
//  StartPageViewController.m
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADStartPageViewController.h"

@interface AWADStartPageViewController ()
@property (nonatomic,weak) IBOutlet UIButton* datePickerButton;
@property (nonatomic,weak) IBOutlet UIButton* searchButton;
@property (nonatomic,weak) IBOutlet UITextField* arrivalTextField;
@property (nonatomic,weak) IBOutlet UITextField* destinationTextField;
@property (nonatomic,weak) IBOutlet UIView* suggestsView;
-(IBAction)  showDatePicker:(id) sender;
-(IBAction)  searchButtonTap:(id) sender;
@end

@implementation AWADStartPageViewController

@synthesize suggestsContainer;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Main Screen";
    self.presenter.view = self;
    self.arrivalTextField.placeholder = @"Откуда";
    self.destinationTextField.placeholder = @"Куда";
    [self.datePickerButton setTitle:@"Выберите дату" forState:UIControlStateNormal];
    [self.searchButton setTitle:@"Поиск" forState:UIControlStateNormal];
    [self.presenter updateView];
    suggestsContainer = self.suggestsView;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField.tag==1) {
        [self.presenter changeTextArrival:nil];
    }
    else if(textField.tag == 2)
        [self.presenter changeTextDestination:nil];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSMutableString* str = [NSMutableString stringWithString:textField.text];
    
    [str replaceCharactersInRange:range withString:string];
    if (textField.tag==1) {
        [self.presenter changeTextArrival:str];
    }
    else if(textField.tag == 2)
        [self.presenter changeTextDestination:str];
    return YES;
}


- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}
#pragma mark - Actions
- (void)showDatePicker:(id)sender{
    [self.presenter showDatePickerTap];
}

- (void)searchButtonTap:(id)sender{
   [self.presenter searchButtonTap];
}

#pragma mark - AWADStartPageView

- (void)setAvailableSearch:(BOOL)isAvailable{
    [self.searchButton setEnabled:isAvailable];
}

- (void)setTextArrival:(NSString*)text{
    [self.arrivalTextField setText:text];
}

- (void)setTextDestination:(NSString*)text{
    [self.destinationTextField setText:text];
}

- (void)resignFirstResponderArrivalTextField{
    [self.arrivalTextField resignFirstResponder];
}

- (void)resignFirstResponderDestinationTextField{
     [self.destinationTextField resignFirstResponder];
}


@end
