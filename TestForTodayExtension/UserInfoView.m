//
//  UserInfoView.m
//  TestForTodayExtension
//
//  Created by Shane on 2020/6/4.
//  Copyright © 2020 Shane. All rights reserved.
//

#import "UserInfoView.h"

@implementation UserInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor greenColor];
}

@end
