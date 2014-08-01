//
//  SVScreenshotUtil.m
//  Savvee
//

#import "ZScreenshotUtil.h"

@implementation ZScreenshotUtil

+ (UIImage *)getScreenshotForView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
