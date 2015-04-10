//
//  InterfaceController.m
//  FTPractice WatchKit Extension
//
//  Created by Yunzhu Li on 04/10/15.
//  Copyright (c) 2015 Yunzhu Li. All rights reserved.
//

#import "FPICMain.h"


@interface FPICMain()

@property (weak, nonatomic) IBOutlet WKInterfaceButton *btnTouch;

@end


@implementation FPICMain

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
}

- (void)willActivate {
    [super willActivate];
}

- (void)didDeactivate {
    [super didDeactivate];
}

- (IBAction)btnTouchAct {
	[_btnTouch setTitle:@"Touched!"];
	[self performSelector:@selector(restoreBtnTitle) withObject:nil afterDelay:1];
}

- (void)restoreBtnTitle {
	[_btnTouch setTitle:@"Touch or Press"];
}

- (void)startBGFading {
	
	
	
}

@end



