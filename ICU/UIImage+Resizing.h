//
//  UIImage+Resizing.h
//  ICU
//
//  Created by 陈曦翔 on 4/30/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resizing)

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end
