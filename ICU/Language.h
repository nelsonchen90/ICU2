//
//  Language.h
//  ICU
//
//  Created by 陈曦翔 on 4/17/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Language : NSObject

+(void)initialize;
+(void)setLanguage:(NSString *)l;
+(NSString *)get:(NSString *)key alter:(NSString *)alternate;
+(NSString*)getCurrentLanguage;
@end
