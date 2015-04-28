//
//  ItchAndPainViewController.m
//  ICU
//
//  Created by 陈曦翔 on 4/14/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "ItchAndPainViewController.h"
#import "HumanBodyImageView.h"
#import "Language.h"
@interface ItchAndPainViewController ()

@end

@implementation ItchAndPainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [Language get:_mainCategory.categoryName alter:nil];
    CGAffineTransform trans=CGAffineTransformMakeRotation(-M_PI_2);
    _scaleSlider.transform=trans;
    _titleLabel.text = [Language get:@"scale" alter:nil];
    self.areaLabel.text = [Language get:@"area" alter:nil];
    
    [((HumanBodyImageView*)self.bodyImage) changeCircleDiameter:self.areaSlider.value];
    [((HumanBodyImageView*)self.bodyImage) changeColor:self.scaleSlider.value];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sliderValueChange:(id)sender
{
    //self.degreeLabel.text = [NSString stringWithFormat:@"%.2f",self.degreeSlider.value];
    [((HumanBodyImageView*)self.bodyImage) changeCircleDiameter:self.areaSlider.value];
}

- (IBAction)scaleSliderValueChange:(id)sender
{
    [((HumanBodyImageView*)self.bodyImage) changeColor:self.scaleSlider.value];
}



@end
