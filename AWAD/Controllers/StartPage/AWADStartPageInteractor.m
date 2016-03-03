//
//  AWADStartPageInteractor.m
//  AWAD
//
//  Created by user on 29.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADStartPageInteractor.h"
#import "AWADUserInputModel.h"
#import "AWADCitySuggestModel.h"
#import "AWADUserInputModel.h"
@implementation AWADStartPageInteractor{
    NSArray* _cachedSuggests;
    AWADUserInputModel *currentUserModel;
    BOOL _isArrivalText;
}

- (void)updateValues{
    if (!currentUserModel) {
        currentUserModel = [AWADUserInputModel new];
    }
    [self sendValue];
}

-(void)sendValue{
    [self.startPagePresenter updatePosibility:[currentUserModel isReadyForRequest]];
}

-(void)changeText:(NSString *)text isArrivalText:(BOOL)isArrivalText{
    
    _isArrivalText = isArrivalText;
    if (!text) {
        _isArrivalText?[currentUserModel setArrival:nil]:[currentUserModel setDestination:nil];
    }
    if (text.length<2) return;
    __weak typeof(self) _weakSelf = self;
    [self.suggestsService suggestCityForText:text].then(^(NSArray* arr){
        NSMutableArray* suggests = [NSMutableArray new];
        for (AWADCitySuggestModel* result in arr) {
            [suggests addObject:result.city];
        }
        [_weakSelf.suggestsPresenter updateSuggests:suggests];
        _cachedSuggests = [arr copy];
        
        
    }).catch(^(NSError* error){
       
    });
}




#pragma mark - Suggests output



#pragma mark - Suggest Input
-(void)suggestsDidSelect:(NSIndexPath *)index{
    AWADCitySuggestModel* result = [_cachedSuggests objectAtIndex:index.row];
    _isArrivalText ? [currentUserModel setArrival:result]:[currentUserModel setDestination:result];
    _isArrivalText?[self.startPagePresenter setTextArrival:result.city]:[self.startPagePresenter setTextDestination:result.city];
    [self sendValue];
}

#pragma mark - DatePicker input

-(void)setDate:(NSDate *)date{
    currentUserModel.date = date;
    [self sendValue];
}

#pragma mark - AWADResultProtocol
-(AWADUserInputModel*)getUserModel{
    return currentUserModel;
}

@end
