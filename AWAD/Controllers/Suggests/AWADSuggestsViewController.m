//
//  AWADSuggestsViewController.m
//  AWAD
//
//  Created by user on 01.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADSuggestsViewController.h"

static NSString* const kSuggestCellId = @"suggestCellId";

@interface AWADSuggestsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *suggestsTable;

@end

@implementation AWADSuggestsViewController{
    NSMutableArray* dataSourceArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.suggestsTable.tableFooterView = [UIView new];
    dataSourceArray = [NSMutableArray new];
    self.presenter.suggestsView = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
-(void)setDataSource:(NSArray*)arraySuggests{
    dataSourceArray = [NSMutableArray arrayWithArray:arraySuggests];
    [self.suggestsTable reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataSourceArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kSuggestCellId forIndexPath:indexPath];
    if (cell) {
        cell.textLabel.text = [dataSourceArray objectAtIndex:indexPath.row];
    }
    return cell;
}
#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.presenter selectSuggest:indexPath];
}

@end
