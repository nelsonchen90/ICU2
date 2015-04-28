//
//  MainCategory.h
//  ICU
//
//  Created by 陈曦翔 on 4/8/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainCategory : NSObject

@property NSString *categoryName;
@property NSString *iconFile;
@property NSString *soundFile;
@property NSString *subcategoriesIconDirectory;
@property NSString *subcategoriesSoundFileDirectory;
@property NSMutableArray *subcategoriesList;

-(id) initWithDictionary:(NSDictionary*)dict;

@end
