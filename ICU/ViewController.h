//
//  ViewController.h
//  ICU
//
//  Created by 陈曦翔 on 4/4/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ScrollProtocol.h"

@interface ViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate,ScrollProtocol>
@property NSMutableArray *categoryArray;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *settingButton;



@end

