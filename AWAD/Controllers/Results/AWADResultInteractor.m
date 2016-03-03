//
//  AWADResultInteractor.m
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADResultInteractor.h"
#import "AWADUserInputModel.h"
#import "AWADSearchRequestModel.h"

#import "AWADTicketsItemModel.h"
#import "AWADTicketsFareItem.h"
#import "ASTSort.h"
@interface AWADResultInteractor()

@property (nonatomic, weak) AWADUserInputModel *currentUserModel;
@property (nonatomic, weak) NSArray* currentResults;
@property (nonatomic, weak) NSString* idSynonym;
@end

@implementation AWADResultInteractor



#pragma mark - AWADResultInput
-(void)updateView{
    if (!self.currentUserModel) {
        [self _updateCurrentUserInput];
    }
    if (!self.currentResults) {
        [self.searchPresenter presentView];
        [self _startSearchService];
    }

}

#pragma mark - Private methods

- (void)_updateCurrentUserInput{
    if (self.delegate && [self.delegate respondsToSelector:@selector(getUserModel)]) {
        self.currentUserModel = [self.delegate getUserModel];
    }
}

- (void)_startSearchService{
    NSString* requestString = [self.currentUserModel getSearchRequest];
    __weak typeof(self) _weakSelf = self;

   __block NSString* synonim;
    [self.searchService searchForText:requestString].then(^(AWADSearchRequestModel *result){
        synonim = result.synonym;
        return [self.ticketsService ticketsForString:synonim callBackPercent:^(double percent) {
            NSLog(@"%f",percent);
        }];
    }).then(^(NSArray *obj){
        return [self processResult:obj];
    });

 
}


- (PMKPromise* )processResult:(NSArray*)arr{
    return [PMKPromise promiseWithResolver:^(PMKResolver resolve) {
        for (AWADTicketsItemModel *item in arr) {
            
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
        resolve(arr);
    }];
}

@end
