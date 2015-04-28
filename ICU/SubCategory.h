//
//  SubCategory.h
//  ICU
//
//  Created by 陈曦翔 on 4/8/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubCategory : NSObject

@property NSString *subcategoryName;
@property NSString *fileName;
@property NSString *categoryDescription;

-(id) initWithDictionary:(NSDictionary*)dict;

@end
