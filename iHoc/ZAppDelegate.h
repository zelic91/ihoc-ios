//
//  ZAppDelegate.h
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ApplicationDelegate ((ZAppDelegate *)[UIApplication sharedApplication].delegate)

@interface ZAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ZNetworkEngine *networkEngine;

@end
