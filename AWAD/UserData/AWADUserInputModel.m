//
//  AWADUserInputModel.m
//  AWAD
//
//  Created by user on 01.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "AWADUserInputModel.h"

@implementation AWADUserInputModel

-(BOOL)isReadyForRequest{
    if (self.arrival && self.destination && self.date) {
        return YES;
    }
    return NO;
}


-(NSString *)getSearchRequest{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"ddMM"];
    return [NSString stringWithFormat:@"%@%@%@",[df stringFromDate:self.date],self.arrival.cityCode,self.destination.cityCode];
}

@end
