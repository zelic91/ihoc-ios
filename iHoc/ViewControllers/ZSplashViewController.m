//
//  ZSplashViewController.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZSplashViewController.h"

#define kSegueId @"FromSplashToDashboard"

@interface ZSplashViewController ()

@end

@implementation ZSplashViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      //Move to dashboard
        [self performSegueWithIdentifier:kSegueId sender:self];
    });
}

@end
