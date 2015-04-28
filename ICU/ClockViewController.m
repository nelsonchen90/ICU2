//
//  ClockViewController.m
//  ICU
//
//  Created by 陈曦翔 on 4/24/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "ClockViewController.h"

@interface ClockViewController ()

@end

@implementation ClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateTime];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateTime{
    [_updateTimer invalidate];
    _updateTimer=nil;
    _currentTime = [NSDate date];
    NSDateFormatter* timeFormatter = [[NSDateFormatter alloc]init];
    [timeFormatter setTimeStyle:NSDateFormatterMediumStyle];
    _timeLabel.text = [timeFormatter stringFromDate:_currentTime];
    _updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
