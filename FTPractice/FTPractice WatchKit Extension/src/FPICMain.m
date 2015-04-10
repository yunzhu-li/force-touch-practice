//
//  InterfaceController.m
//  FTPractice WatchKit Extension
//
//  Created by Yunzhu Li on 04/10/15.
//  Copyright (c) 2015 Yunzhu Li. All rights reserved.
//

#import "FPICMain.h"
#import "FPUIUtils.h"

@interface FPICMain()

@property (weak, nonatomic) IBOutlet WKInterfaceButton *btnTouch;
@property (assign, nonatomic) int currentBGCIndex;
@property (strong, nonatomic) NSArray *fiveColors;
@property (weak, nonatomic) NSTimer *tmBGFader;

@end

@implementation FPICMain

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
	
	// Get colors
	self.fiveColors = [FPUIUtils fiveColors];
}

- (void)willActivate {
    [super willActivate];
	
	_currentBGCIndex = 0;
	[self startBGFading];
}

- (void)didDeactivate {
    [super didDeactivate];
	[self.tmBGFader invalidate];
}

- (IBAction)btnTouchAct {
	[_btnTouch setTitle:@"Touched!"];
	[self performSelector:@selector(restoreBtnTitle) withObject:nil afterDelay:1];
}

- (void)restoreBtnTitle {
	[_btnTouch setTitle:@"Touch or Press"];
}

- (void)startBGFading {
	//self.tmBGFader = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(fadeBG) userInfo:nil repeats:YES];
}

- (void)fadeBG {
	[_btnTouch setBackgroundColor:_fiveColors[_currentBGCIndex]];
	_currentBGCIndex = (_currentBGCIndex + 1) % 5;
}

@end



