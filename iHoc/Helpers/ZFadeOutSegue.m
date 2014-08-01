//
//  SVFadeOutSegue.m
//  Savvee
//

#import "ZFadeOutSegue.h"
#import "ZScreenshotUtil.h"

@implementation ZFadeOutSegue

-(void)perform {
    UIViewController *sourceViewController = [self sourceViewController];
    UIViewController *destViewController = [self destinationViewController];
    
    [destViewController.view layoutSubviews];
    destViewController.view.bounds = sourceViewController.view.bounds;
    destViewController.view.transform = CGAffineTransformMakeScale(1.2, 1.2);
    
    UIImageView *sourceImageView = [[UIImageView alloc] initWithImage:[ZScreenshotUtil getScreenshotForView:sourceViewController.view]];
    [sourceViewController.view addSubview:destViewController.view];
    [sourceViewController.view addSubview:sourceImageView];
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         destViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         sourceImageView.alpha = 0;
                     } completion:^(BOOL finished) {
                         [destViewController.view removeFromSuperview];
                         [sourceImageView removeFromSuperview];
                         [sourceViewController presentViewController:destViewController animated:NO completion:nil];
                     }];
}
@end
