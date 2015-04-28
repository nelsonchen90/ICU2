//
//  HumanBodyImageView.h
//  ICU
//
//  Created by 陈曦翔 on 4/14/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HumanBodyImageView : UIImageView

@property UIView* circleView;
@property float diameter;
@property CGRect lastRect;
@property UIColor* bgColor;

-(void) changeCircleDiameter:(float)diameter;
-(void) changeColor:(float)sliderValue;

@end
