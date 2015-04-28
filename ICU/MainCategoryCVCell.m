//
//  MainCategoryCVCell.m
//  ICU
//
//  Created by 陈曦翔 on 4/11/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "MainCategoryCVCell.h"

@implementation MainCategoryCVCell

- (IBAction)playSound:(id)sender
{
    NSLog(@"play");
    
    NSError *error;
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:_soundFileURL
                                                     error:&error];
    _player.delegate = self;
   // _player.numberOfLoops = 0;
    [_player play];
 
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    // release player to preserve memory
    _player =nil;
    //    NSLog(@"Song finished playing!");
}
@end
