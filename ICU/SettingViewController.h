//
//  SettingViewController.h
//  ICU
//
//  Created by Chen Liu on 4/23/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *languageLabel;
@property (strong, nonatomic) IBOutlet UILabel *switchLabel;
@property (strong, nonatomic) IBOutlet UILabel *voiceLabel;
@property (strong, nonatomic) IBOutlet UIButton *enButton;
@property (strong, nonatomic) IBOutlet UIButton *esButton;
@property (strong, nonatomic) IBOutlet UISwitch *voiceSwitch;
- (IBAction)voiceSwitchOn:(id)sender;
- (IBAction)setEnglish:(id)sender;
- (IBAction)setSpanish:(id)sender;
@end
