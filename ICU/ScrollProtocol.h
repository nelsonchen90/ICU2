//
//  ScrollProtocol.h
//  ICU
//
//  Created by 陈曦翔 on 4/16/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

@protocol ScrollProtocol <NSObject>

-(void) scrollViewDidScroll: (UIScrollView*)scrollView;
-(void) scrollNextTap;
-(void) scrollNextRelease;
-(void) scrollBackTap;
-(void) scrollBackRelease;
-(void) createNavigationalButton;

@end