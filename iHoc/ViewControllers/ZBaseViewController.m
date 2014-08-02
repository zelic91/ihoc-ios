//
//  ZBaseViewController.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZBaseViewController.h"

@interface ZBaseViewController ()

@end

@implementation ZBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)setLeftNavButton:(UIImage *)image
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 30, 44);
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(leftNavButtonDidTouch:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)setRightNavButton:(UIImage *)image
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 30, 44);
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightNavButtonDidTouch:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
}

#pragma mark - Override these methods to get left and right nav buttons click call
- (void)leftNavButtonDidTouch:(UIButton *)button
{
    if ([_delegate respondsToSelector:@selector(leftButtonDidTouch:)]) {
        [_delegate leftButtonDidTouch:button];
    }
}

- (void)rightNavButtonDidTouch:(UIButton *)button
{
    if ([_delegate respondsToSelector:@selector(rightButtonDidTouch:)]) {
        [_delegate rightButtonDidTouch:button];
    }
}

@end
