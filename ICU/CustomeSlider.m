//
//  CustomeSlider.m
//  ICU
//
//  Created by 陈曦翔 on 4/28/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "CustomeSlider.h"

@implementation CustomeSlider

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (CGRect)trackRectForBounds:(CGRect)bounds{
    return  CGRectMake(0, 0, 400, 50);
}


@end
