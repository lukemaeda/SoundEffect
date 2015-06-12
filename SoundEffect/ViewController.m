//
//  ViewController.m
//  SoundEffect
//
//  Created by kunren10 on 2014/03/19.
//  Copyright (c) 2014年 Hajime Maeda. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import "ViewController.h"

@interface ViewController () {
    
    SystemSoundID _ssId01;
    SystemSoundID _ssId02;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self doReady];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// [#01]ボタン押した時
- (IBAction)play01:(id)sender {
    
    NSLog(@"サウンド3");
    AudioServicesPlaySystemSound(_ssId01);
    
}

// [#02]ボタン押した時
- (IBAction)play02:(id)sender {
    
    NSLog(@"サウンド4");
    AudioServicesPlaySystemSound(_ssId02);
    
}

// [振動]ボタン押した時
- (IBAction)vibtate:(id)sender {
    
    NSLog(@"サウンド5");
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
}

// 準備処理
- (void)doReady {
    
    NSLog(@"サウンド");
    NSBundle *bnd = [NSBundle mainBundle];
    
    // 設定#01
    NSURL *url01 = [bnd URLForResource:@"mp01"
                         withExtension:@"mp3"];
    
    CFURLRef urr01 = (CFURLRef) CFBridgingRetain(url01);
    AudioServicesCreateSystemSoundID(urr01, &_ssId01);
    CFRelease(urr01);
    
    // 設定#02
    NSURL *url02 = [bnd URLForResource:@"mp02"
                         withExtension:@"mp3"];
    
    CFURLRef urr02 = (CFURLRef) CFBridgingRetain(url02);
    AudioServicesCreateSystemSoundID(urr02, &_ssId02);
    CFRelease(urr02);
    
    NSLog(@"サウンド2");

}

@end
