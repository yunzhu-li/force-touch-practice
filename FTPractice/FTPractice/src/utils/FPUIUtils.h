//
//  FPUIUtils.h
//  FTPractice
//
//  Created by Yunzhu Li on 04/10/15.
//  Copyright (c) 2015 Yunzhu Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FPUIUtils : NSObject

+ (NSArray *)fiveColors;
+ (void)fadeView:(UIView *)view toColor:(UIColor *)color completion:(void (^)(BOOL finished))completion;

@end
