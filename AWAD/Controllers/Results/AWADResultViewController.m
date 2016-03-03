//
//  AWADResultViewController.m
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADResultViewController.h"
#import "AWADTicketsItemModel.h"
#import "AWADTicketsFareItem.h"

//Hack =))
#import "AWADResultDetailViewController.h"

static NSString* const kAirlineCellId = @"kAirlineCellId";
@interface AWADResultViewController()
@property (weak, nonatomic) IBOutlet UITableView *airlinesTableView;
@property (weak, nonatomic) IBOutlet UIView *progressContainerView;

@end

@implementation AWADResultViewController{
    NSArray* _dataSource;
    NSIndexPath *_lastSelectedIndex;
}

@synthesize containerView;
-(void)viewDidLoad{
    self.presenter.view = self;
    [super viewDidLoad];
    containerView = self.progressContainerView;
    [self.presenter updateView];
    self.airlinesTableView.tableFooterView = [UIView new];
}

#pragma mark - AWADResultView

-(void)updateDataSource:(NSArray *)arr{
    _dataSource = arr;
    [self.airlinesTableView reloadData];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kAirlineCellId forIndexPath:indexPath];
    AWADTicketsItemModel *model = [_dataSource objectAtIndex:indexPath.row];
    if (cell) {
        [cell.textLabel setText:model.code];
        AWADTicketsFareItem* firstFare = [model.fares objectAtIndex:0];
        [cell.detailTextLabel setText:[firstFare.totalAmount stringValue]];
    }
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _lastSelectedIndex = indexPath;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.destinationViewController isKindOfClass:[AWADResultDetailViewController class]]){
        AWADResultDetailViewController *destVC = segue.destinationViewController;
        if (destVC) {
            destVC.detailList = [[_dataSource objectAtIndex:_lastSelectedIndex.row] fares];
        
        }
    }
}
@end
