//
//  ZBaseViewController.h
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZNavDelegate <NSObject>
@optional
- (void)leftButtonDidTouch:(UIButton *)button;
- (void)rightButtonDidTouch:(UIButton *)button;
@end

@interface ZBaseViewController : UIViewController
@property (strong, nonatomic) id<ZNavDelegate> delegate;
- (void)setLeftNavButton:(UIImage *)image;
- (void)setRightNavButton:(UIImage *)image;
@end
