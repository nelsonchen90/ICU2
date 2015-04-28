//
//  SubCategoryViewController.h
//  ICU
//
//  Created by Muddassar Mubeen on 4/10/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainCategory.h"
#import "SubCategory.h"
#import "ScrollProtocol.h"

@interface SubCategoryViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate,ScrollProtocol>
@property (strong, nonatomic) IBOutlet UICollectionView *SubcategoryCollectionView;
@property (strong) MainCategory* mainCategory;
@end
