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

#import "FPICMain.h"
#import "FPUIUtils.h"

@interface FPICMain()

@property (weak, nonatomic) IBOutlet WKInterfaceButton *btnTouch;

// Color fading
@property (strong, nonatomic) NSArray *fiveColors;
@property (assign, nonatomic) int currentBGCIndex;
@property (assign, nonatomic) int currentBGCFadingProgress;
@property (strong, nonatomic) UIColor *wkFadingColorStart;
@property (strong, nonatomic) UIColor *wkFadingColorEnd;
@property (weak, nonatomic) NSTimer *tmBGFader;
@property (weak, nonatomic) NSTimer *tmBGFaderMicro;

@end

@implementation FPICMain

- (void)awakeWithContext:(id)context {
	[super awakeWithContext:context];
	
	// Get colors
	self.fiveColors = [FPUIUtils fiveColors];
}

- (void)willActivate {
	[super willActivate];
	
	_currentBGCIndex = 1;
	[self startBGFading];
}

- (void)didDeactivate {
	[super didDeactivate];
	[self.tmBGFader invalidate];
	[self.tmBGFaderMicro invalidate];
}

- (IBAction)btnTouchAct {
	[_btnTouch setTitle:@"Touched!"];
	[self performSelector:@selector(restoreBtnTitle) withObject:nil afterDelay:1];
}

- (void)restoreBtnTitle {
	[_btnTouch setTitle:@"Touch or Press"];
}

- (void)startBGFading {
	self.tmBGFader = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(fadeBG) userInfo:nil repeats:YES];
	self.wkFadingColorEnd = _fiveColors[0];
}

- (void)fadeBG {
	self.wkFadingColorStart = self.wkFadingColorEnd;
	self.wkFadingColorEnd = _fiveColors[_currentBGCIndex];
	_currentBGCFadingProgress = 0;
	
	self.tmBGFaderMicro = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(fadeBGMicro) userInfo:nil repeats:YES];
	
	_currentBGCIndex = (_currentBGCIndex + 1) % 5;
}

- (void)fadeBGMicro {
	CGFloat progress = _currentBGCFadingProgress / 10.0f;
	CGFloat r_start, g_start, b_start, r_end, g_end, b_end;
	
	[_wkFadingColorStart getRed:&r_start green:&g_start blue:&b_start alpha:nil];
	[_wkFadingColorEnd getRed:&r_end green:&g_end blue:&b_end alpha:nil];
	
	UIColor *color = [UIColor colorWithRed:r_start + (r_end - r_start) * progress
									 green:g_start + (g_end - g_start) * progress
									  blue:b_start + (b_end - b_start) * progress
									 alpha:1];
	
	[_btnTouch setBackgroundColor:color];
	
	_currentBGCFadingProgress++;
	if (_currentBGCFadingProgress > 10)
		[self.tmBGFaderMicro invalidate];
}

@end
