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
