//
//  MainCategory.m
//  ICU
//
//  Created by 陈曦翔 on 4/8/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "MainCategory.h"
#import "SubCategory.h"
@implementation MainCategory


-(id) initWithDictionary:(NSDictionary*)dict
{
    self = [super init];
    if(self)
    {
        self.categoryName = [dict valueForKey:@"categoryName"];
        self.iconFile = [dict valueForKey:@"iconFile"];
        self.soundFile = [dict valueForKey:@"soundFile"];
        self.subcategoriesIconDirectory = [dict valueForKey:@"subcategoriesIconDirectory"];
        self.subcategoriesSoundFileDirectory = [dict valueForKey:@"subcategoriesSoundDirectory"];
        
        if ([dict objectForKey:@"subcategories"]) {
            self.subcategoriesList = [NSMutableArray array];
            for(id subDic in [dict objectForKey:@"subcategories"]){
                SubCategory *subCate = [[SubCategory alloc]initWithDictionary:subDic];
                [self.subcategoriesList addObject:subCate];
            }
        }
    }
    return self;
}

@end
