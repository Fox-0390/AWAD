//
//  AWADResultDetailViewController.m
//  AWAD
//
//  Created by user on 03.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADResultDetailViewController.h"
#import "AWADTicketsFareItem.h"
static NSString* const kCellID = @"detailCellId";

@implementation AWADResultDetailViewController


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.detailList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AWADTicketsFareItem* farItem = [self.detailList objectAtIndex:indexPath.row];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellID
                                                            forIndexPath:indexPath];
    
    if (cell) {
        [cell.textLabel setText:[NSString stringWithFormat:@"%@",farItem.totalAmount]];
    }
    return cell;
}

@end
