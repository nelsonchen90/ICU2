//
//  BackgroundColor.m
//  ICU
//
//  Created by 陈曦翔 on 5/1/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "BackgroundColor.h"

@implementation BackgroundColor
static UIColor* bgColor;

+(void)initBGColor
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *colorData = [userDefaults objectForKey:@"bgColor"];
    if(!colorData){
        [self setColor:[UIColor whiteColor]];
    }else
    {
        UIColor *color = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
        [self setColor:color];
    }
}

+(void)setColor:(UIColor*)color;
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:color];
    [userDefaults setObject:colorData forKey:@"bgColor"];
    [userDefaults synchronize];
    
    bgColor = color;
}

+(UIColor*)getColor
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *colorData = [userDefaults objectForKey:@"bgColor"];
    if(!colorData){
        [self setColor:[UIColor whiteColor]];
    }else
    {
        UIColor *color = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
        [self setColor:color];
    }
    return bgColor;
}


@end
