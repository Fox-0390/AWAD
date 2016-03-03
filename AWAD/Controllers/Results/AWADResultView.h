//
//  AWADResultView.h
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AWADResultView

- (void)updateDataSource:(NSArray*)arr;

@property (nonatomic,strong) UIView* containerView;

@end
