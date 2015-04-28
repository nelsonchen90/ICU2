//
//  CalendarViewController.m
//  ICU
//
//  Created by 陈曦翔 on 4/24/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDate *date=[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-YYYY EEE"];
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    
    _dateLabel.text=currentDateStr;
    //_dateLabel.font=[UIFont systemFontOfSize:80];
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

@end
