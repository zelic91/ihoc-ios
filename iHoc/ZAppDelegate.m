//
//  ZAppDelegate.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZAppDelegate.h"

@implementation ZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UINavigationBar appearance] setBarTintColor:kColorGreen];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kColorWhite, NSForegroundColorAttributeName, kFontBold(20), NSFontAttributeName, nil]];
    [[UINavigationBar appearance] setBackgroundColor:kColorGreen];
    
    //Init network delegate
    self.networkEngine = [[ZNetworkEngine alloc] initWithHostName:kHost];
    [UIImageView setDefaultEngine:self.networkEngine];
    
    return YES;
}
@end
