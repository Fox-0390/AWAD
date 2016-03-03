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
    [self.searchService searchForText:requestString].then(^(AWADSearchRequestModel * model)
                                                          {
                                                              if (!model.error) {
                                                                  [self.ticketsService ticketsForString:model.synonym percentage:^(double currentPercent) {
                                                                      
                                                                  }].then(^(NSArray* array){
                                                                      _currentResults = array;
                                                                  });
                                                                  
                                                                                                                                 };
                                                                }).catch(^(NSError* error){
                                                                                      // TODO: alertView maybe)
                                                                                     });
}

@end
