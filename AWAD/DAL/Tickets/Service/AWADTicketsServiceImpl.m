//
//  AWADTicketsServiceImpl.m
//  AWAD
//
//  Created by user on 03.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADTicketsServiceImpl.h"
#import "ASTSort.h"
#import "AWADTicketsItemModel.h"
#import "AWADTicketsFareItem.h"
#import "AWADTickerRequestState.h"
@implementation AWADTicketsServiceImpl{
    percentCallback _block;
}



-(PMKPromise *)ticketsForString:(NSString *)text callBackPercent:(percentCallback) callback{
    _block = [callback copy];
    return [self getRequestState:text].then( ^(id obj) {
                                            return [PMKPromise promiseWithResolver:^(PMKResolver resolve) {
        PMKPromise *result = [self.repository ticketsForString:text];
        result.then(^(NSArray* array){
            for (AWADTicketsItemModel *item in array) {
                
                NSArray* newArray = ASTSort(item.fares, ^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                    AWADTicketsFareItem *firstItem = obj1;
                    AWADTicketsFareItem *secondItem = obj2;
                    if (firstItem.totalAmount > secondItem.totalAmount) {
                        return NSOrderedAscending;
                    }
                    if (firstItem.totalAmount < secondItem.totalAmount) {
                        return NSOrderedDescending;
                    }
                     return NSOrderedSame;
                });
                item.fares = newArray;
                
            }
            resolve(array);
            
            
        });
        
                                            }];
    });
}


- (PMKPromise*) getRequestState:(NSString*)text{
    return [self.requestStateRepository ticketRequestState:text callBackPercent:_block];
}


@end
