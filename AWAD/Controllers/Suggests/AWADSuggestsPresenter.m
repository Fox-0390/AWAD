//
//  AWADSuggestsPresenter.m
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADSuggestsPresenter.h"

@implementation AWADSuggestsPresenter



-(void)updateSuggests:(NSArray*)suggestsArray{
    [self.suggestsView setDataSource:suggestsArray];
}


- (void)selectSuggest:(NSIndexPath*)index{
    [self.interactor suggestsDidSelect:index];
}

@end
