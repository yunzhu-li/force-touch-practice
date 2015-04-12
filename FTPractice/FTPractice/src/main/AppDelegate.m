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

#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Optional: automatically send uncaught exceptions to Google Analytics.
	[GAI sharedInstance].trackUncaughtExceptions = YES;
	
	// Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
	[GAI sharedInstance].dispatchInterval = 20;
	
	// Optional: set Logger to VERBOSE for debug information.
	[[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
	
	// Initialize tracker. Replace with your tracking ID.
	[[GAI sharedInstance] trackerWithTrackingId:@"UA-61812304-2"];
	
	// Override point for customization after application launch.
	[application setStatusBarStyle:UIStatusBarStyleLightContent];
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
