//
//  ViewController.m
//  FTPractice
//
//  Created by Yunzhu Li on 04/10/15.
//  Copyright (c) 2015 Yunzhu Li. All rights reserved.
//

#import "FPVCMain.h"
#import "FPUIUtils.h"

@interface FPVCMain ()

@property (assign, nonatomic) int currentBGCIndex;
@property (strong, nonatomic) NSArray *fiveColors;
@property (weak, nonatomic) NSTimer *tmBGFader;

@end

@implementation FPVCMain

- (void)viewDidLoad {
	[super viewDidLoad];
	[self setNeedsStatusBarAppearanceUpdate];
	// Get colors
	self.fiveColors = [FPUIUtils fiveColors];
}

- (void)viewDidAppear:(BOOL)animated {
	_currentBGCIndex = 1;
	[self startBGFading];
}

- (void)viewDidDisappear:(BOOL)animated {
	[self.tmBGFader invalidate];
}

- (UIStatusBarStyle) preferredStatusBarStyle {
	return UIStatusBarStyleLightContent;
}

- (void)startBGFading {
	self.tmBGFader = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(fadeBG) userInfo:nil repeats:YES];
}

- (void)fadeBG {
	[FPUIUtils fadeView:self.view toColor:_fiveColors[_currentBGCIndex] completion:nil];
	_currentBGCIndex = (_currentBGCIndex + 1) % 5;
}

- (IBAction)btnLinkAct:(UIButton *)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://yunzhu.li"]];
}

@end
