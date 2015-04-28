//
//  Language.m
//  ICU
//
//  Created by 陈曦翔 on 4/17/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "Language.h"

@implementation Language

static NSBundle *bundle = nil;
static NSString *language =@"en";

+(void)initialize {
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defs objectForKey:@"AppleLanguages"];
    NSString* defaultLanguage = [defs valueForKey:@"Language"];
    if(defaultLanguage)
    {
        [self setLanguage:defaultLanguage];
    }else
    {
        NSString *current = [languages objectAtIndex:0];
        [self setLanguage:current];
    }
}

/*
 example calls:
 [Language setLanguage:@"it"];
 [Language setLanguage:@"de"];
 */
+(NSString*)getCurrentLanguage{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    return [userDefaults valueForKey:@"Language"];
    //return language;
}

+(void)setLanguage:(NSString *)l {
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:l forKey:@"Language"];
    [userDefaults synchronize];
    
    language = l;
    NSString *path = [[ NSBundle mainBundle ] pathForResource:l ofType:@"lproj" ];
    bundle = [NSBundle bundleWithPath:path];
}

+(NSString *)get:(NSString *)key alter:(NSString *)alternate {
    return [bundle localizedStringForKey:key value:alternate table:nil];
}

@end