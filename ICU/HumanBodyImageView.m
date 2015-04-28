//
//  HumanBodyImageView.m
//  ICU
//
//  Created by 陈曦翔 on 4/14/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "HumanBodyImageView.h"

@implementation HumanBodyImageView
{

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location;
    if ([touch.view isKindOfClass:[UIImageView class]]) {
        location = [touch locationInView:touch.view];
    }else{
        location = [touch locationInView:touch.view.superview];
    }
    
    NSLog(@"(%f,%f)",location.x,location.y);
    self.lastRect = CGRectMake(location.x,location.y, self.diameter, self.diameter);
    [self markWithCGRect];
}

-(void) markWithCGRect
{
    if(!self.circleView)
    {
        self.circleView = [[UIView alloc] initWithFrame:self.lastRect];
        self.circleView.alpha = 0.5;
        self.circleView.layer.cornerRadius = self.lastRect.size.height/2;
        self.circleView.backgroundColor = self.bgColor;
        [self addSubview:self.circleView];
    }
    
    [self.circleView setFrame:self.lastRect];
    self.circleView.center = CGPointMake(self.lastRect.origin.x, self.lastRect.origin.y);
    NSLog(@"last rect origin(%f,%f)",self.lastRect.origin.x,self.lastRect.origin.y);

     NSLog(@"circle view center(%f,%f)",self.circleView.center.x,self.circleView.center.y);
}

-(void) changeCircleDiameter:(float)diameter
{
    self.diameter = 10+diameter*10;
    self.lastRect = CGRectMake(self.lastRect.origin.x,self.lastRect.origin.y, self.diameter, self.diameter);
    self.circleView.layer.cornerRadius = self.lastRect.size.height/2;
    [self.circleView setFrame:self.lastRect];
    self.circleView.center = CGPointMake(self.lastRect.origin.x, self.lastRect.origin.y);

}
-(void) changeColor:(float)sliderValue
{
    
    UIColor* painColor = [UIColor colorWithRed:(253/255.0) green:(0/255.0) blue:(255*(1-0.1*sliderValue)/255.0) alpha:0.2+0.1*sliderValue];
    self.bgColor=painColor;
    self.circleView.backgroundColor = self.bgColor;
}



@end
