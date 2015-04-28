//
//  ItchAndPainViewController.h
//  ICU
//
//  Created by 陈曦翔 on 4/14/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainCategory.h"
@interface ItchAndPainViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *bodyImage;
@property (strong, nonatomic) IBOutlet UISlider *areaSlider;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *areaLabel;
@property (strong, nonatomic) IBOutlet UISlider *scaleSlider;

@property MainCategory* mainCategory;


- (IBAction)sliderValueChange:(id)sender;
- (IBAction)scaleSliderValueChange:(id)sender;


@end
