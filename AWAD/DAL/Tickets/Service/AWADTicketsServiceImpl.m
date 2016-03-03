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
@implementation AWADTicketsServiceImpl



-(PMKPromise *)ticketsForString:(NSString *)text percentage:(percentage)percent{
   
    
    return [PMKPromise promiseWithResolver:^(PMKResolver resolve) {
            PMKPromise *result = [self.repository ticketsForString:text];
            result.then(^(NSArray* array){
            for (AWADTicketsItemModel *item in array) {
             
                NSArray* newArray = ASTSort(item.fares, ^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                    AWADTicketsFareItem *firstItem = obj1;
                    AWADTicketsFareItem *secondItem = obj2;
                    if (firstItem.totalAmount>secondItem.totalAmount) {
                        return NSOrderedAscending;
                    }
                    if (firstItem.totalAmount<secondItem.totalAmount) {
                        return NSOrderedDescending;
                    }
                    
                    return NSOrderedSame;
                });
                item.fares = newArray;
                
            }
            resolve(array);


        });
        
    }];
}

-(double)updateState:(NSString*)text{
     __block double curPercent = 0.0f;
  PMKPromise *p =[self.requestStateRepository ticketRequestState:text];
    [PMKPromise when:p].then(^(AWADTickerRequestState *state){
        
        curPercent = [state.completed doubleValue];
        
    });
    return curPercent;
}
@end
