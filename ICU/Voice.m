//
//  Voice.m
//  ICU
//
//  Created by 陈曦翔 on 4/28/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "Voice.h"

@implementation Voice
static bool voiceOn;

+(void)initVoice
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL defaultVoice = [userDefaults boolForKey:@"Voice"];
    if(defaultVoice)
    {
        [self setVoiceBool:defaultVoice];
    }
    else
    {
        [self setVoiceBool:YES];
    }
}

+(void) setVoiceBool:(BOOL)value
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:value forKey:@"Voice"];
    [userDefaults synchronize];
    
    voiceOn = value;

}
+(BOOL) getVoiceBool
{
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    voiceOn = [userDefaults boolForKey:@"Voice"];
    return voiceOn;
}

    
@end
