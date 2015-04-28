//
//  SubcategoryCVCell.m
//  ICU
//
//  Created by 陈曦翔 on 4/11/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "SubcategoryCVCell.h"

@implementation SubcategoryCVCell

- (IBAction)playSound:(id)sender
{
    NSLog(@"play");
    
    NSError *error;
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:_soundFileURL
                                                     error:&error];
    
    if(error){
        NSLog(@"%@",error);
    }else
    {
        _player.delegate = self;
//        _player.numberOfLoops = 2;
        [_player play];
    }
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    //[self stop:nil];
    _player =nil;
}

@end
