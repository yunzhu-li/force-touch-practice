//
//  This file is part of Force Touch Practice.
//
//  Created by Yunzhu Li on 04/10/15.
//  Copyright (c) 2015 Yunzhu Li.
//
//  Force Touch Practice is free software: you can redistribute it and/or
//  modify it under the terms of the GNU General Public License version 3
//  as published by the Free Software Foundation.
//
//  Force Touch Practice is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
//  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License along with Force Touch Practice.
//  If not, see http://www.gnu.org/licenses/.
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
	
	// Set screen name.
	self.screenName = @"FPVCMain";
	
	// Get colors
	self.fiveColors = [FPUIUtils fiveColors];
	
	// Status bar
	[self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	_currentBGCIndex = 1;
	[self startBGFading];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	[self.tmBGFader invalidate];
}

- (UIStatusBarStyle) preferredStatusBarStyle {
	return UIStatusBarStyleLightContent;
}

- (void)startBGFading {
	self.tmBGFader = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(fadeBG) userInfo:nil repeats:YES];
	[self fadeBG];
}

- (void)fadeBG {
	[FPUIUtils fadeView:self.view toColor:_fiveColors[_currentBGCIndex] completion:nil];
	_currentBGCIndex = (_currentBGCIndex + 1) % 5;
}

- (IBAction)btnLinkAct:(UIButton *)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://yunzhu.li"]];
}

@end
