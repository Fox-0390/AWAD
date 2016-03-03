//
//  AWADUserInputModel.h
//  AWAD
//
//  Created by user on 01.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADCitySuggestModel.h"


@interface AWADUserInputModel : NSObject

@property(nonatomic,strong) AWADCitySuggestModel* arrival;
@property(nonatomic,strong) AWADCitySuggestModel* destination;
@property(nonatomic,strong) NSDate* date;
@property(nonatomic) BOOL isEconom;
@property (nonatomic,strong) NSNumber* adultCount;


-(BOOL)isReadyForRequest;

-(NSString*)getSearchRequest;

@end
