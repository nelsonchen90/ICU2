//
//  SubCategory.m
//  ICU
//
//  Created by 陈曦翔 on 4/8/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "SubCategory.h"

@implementation SubCategory

-(id) initWithDictionary:(NSDictionary*)dict
{
    self = [super init];
    if(self)
    {
        self.subcategoryName = [dict valueForKey:@"subcategoryName"];
        self.fileName = [dict valueForKey:@"fileName"];
        self.categoryDescription = [dict valueForKey:@"description"];
    }
    return self;
}

@end
