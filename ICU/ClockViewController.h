//
//  ClockViewController.h
//  ICU
//
//  Created by 陈曦翔 on 4/24/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "ViewController.h"

@interface ClockViewController : UIViewController

@property NSDate* currentTime;
@property NSTimer* updateTimer;

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@end
