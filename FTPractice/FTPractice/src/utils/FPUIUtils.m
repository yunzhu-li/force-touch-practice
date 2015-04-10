//
//  FPUIUtils.m
//  FTPractice
//
//  Created by Yunzhu Li on 04/10/15.
//  Copyright (c) 2015 Yunzhu Li. All rights reserved.
//

#import "FPUIUtils.h"


@implementation FPUIUtils

+ (NSArray *)fiveColors {
	return [NSArray arrayWithObjects:
			[UIColor colorWithRed:0.070f green:0.560f blue:0.750f alpha:1],
			[UIColor colorWithRed:0.260f green:0.700f blue:0.678f alpha:1],
			[UIColor colorWithRed:1.000f green:0.500f blue:0.100f alpha:1],
			[UIColor colorWithRed:1.000f green:0.396f blue:0.418f alpha:1],
			[UIColor colorWithRed:0.298f green:0.298f blue:0.298f alpha:1],
			nil];
}

+ (void)fadeView:(UIView *)view toColor:(UIColor *)color completion:(void (^)(BOOL finished))completion {
	[UIView animateWithDuration:2
						  delay:0
						options:UIViewAnimationOptionBeginFromCurrentState
					 animations:^ {
						 view.backgroundColor = color;
					 }
					 completion:completion
	 ];
}

@end
