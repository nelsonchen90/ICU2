//
//  SettingViewController.m
//  ICU
//
//  Created by Chen Liu on 4/23/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "SettingViewController.h"
#import "Language.h"
#import "Voice.h"
#import "BackgroundColor.h"
@interface SettingViewController ()

@end

@implementation SettingViewController{
    NSMutableArray* colorArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingLanguages];
    [self settingVoice];
    [self setBackgroundColor];
}

-(void) setBackgroundColor
{
    self.view.backgroundColor = [BackgroundColor getColor];
}

-(void)settingVoice
{
    BOOL voiceOn = [Voice getVoiceBool];
    if(voiceOn){
        _voiceSwitch.on=YES;
    }else{
        _voiceSwitch.on=NO;
    }
}
-(void)settingLanguages
{
    self.title = [Language get:@"Settings" alter:nil];
    self.switchLabel.text=[Language get:@"On/Off" alter:nil];
    self.languageLabel.text=[Language get:@"Language" alter:nil];
    self.voiceLabel.text=[Language get:@"Voice" alter:nil];
    [self.colorPicker setTitle:[Language get:@"Background Color" alter:nil] forState:UIControlStateNormal];
    if([[Language getCurrentLanguage] isEqualToString:@"en"])
    {
        [self highLihgtSelectedButton:_enButton];
        [self dismissHighLightedButton:_esButton];
    }
    else if([[Language getCurrentLanguage] isEqualToString:@"es"])
    {
        [self highLihgtSelectedButton:_esButton];
        [self dismissHighLightedButton:_enButton];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)highLihgtSelectedButton:(UIButton*)selectedButton
{
    [[selectedButton layer] setBorderWidth:2.0f];
    [[selectedButton layer] setBorderColor:[UIColor redColor].CGColor];
}

- (void)dismissHighLightedButton:(UIButton*)button
{
    [[button layer] setBorderWidth:0.0f];
}


-(void)colorPickerViewController:(FCColorPickerViewController *)colorPicker didSelectColor:(UIColor *)color {
//    self.color = color;
    [BackgroundColor setColor:color];
    [self setBackgroundColor];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)colorPickerViewControllerDidCancel:(FCColorPickerViewController *)colorPicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - ibaction



- (IBAction)setEnglish:(id)sender {
    
    [Language setLanguage:@"en"];
    [self settingLanguages];

}

- (IBAction)setSpanish:(id)sender {
    [Language setLanguage:@"es"];
    [self settingLanguages];

}
- (IBAction)pickColorTapped:(id)sender {
    FCColorPickerViewController *colorPicker = [FCColorPickerViewController colorPicker];
    colorPicker.color = self.color;
    colorPicker.delegate = self;
    
    [colorPicker setModalPresentationStyle:UIModalPresentationFormSheet];
    [self presentViewController:colorPicker animated:YES completion:nil];
}

- (IBAction)voiceSwitchOn:(id)sender {
    if(_voiceSwitch.on){
        [Voice setVoiceBool:YES];
        NSLog(@"voice on");
    }else{
        [Voice setVoiceBool:NO];
        NSLog(@"voice off");
    }
}
@end
