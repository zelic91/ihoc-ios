//
//  ZSplashViewController.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZSplashViewController.h"
#import "ZDashboardViewController.h"

#define kSegueId @"FromSplashToDashboard"

@interface ZSplashViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@end

@implementation ZSplashViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    _backgroundImage.transform = CGAffineTransformMakeScale(1.2, 1.2);
    
    [ApplicationDelegate.networkEngine getDashboardData:^(NSDictionary *data) {
        [self performSegueWithIdentifier:kSegueId sender:data];
    } failure:^(NSArray *data, NSError *error) {
        NSLog(@"Error: %@", error);
        [SVProgressHUD showErrorWithStatus:@"Error"];
    }];
    
    [UIView animateWithDuration:1 delay:0.0f options:UIViewAnimationOptionCurveEaseIn|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        _backgroundImage.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender) {
        ZDashboardViewController *vc = (ZDashboardViewController *)[((UINavigationController *)segue.destinationViewController).viewControllers objectAtIndex:0];
        NSArray *sponsoredCourses = [sender objectForKey:@"sponsored_courses"];
        NSArray *featuredCourses = [sender objectForKey:@"featured_courses"];
        NSArray *featuredPartners = [sender objectForKey:@"featured_partners"];
        NSArray *categories = [sender objectForKey:@"categories"];
        if (sponsoredCourses) {
            NSMutableArray *data = [NSMutableArray array];
            for (NSDictionary *dic in sponsoredCourses) {
                ZCourse *course = [[ZCourse alloc] initWithDic:dic];
                [data addObject:course];
            }
            vc.sponsoredCourses = data;
        }
        
        if (featuredCourses) {
            NSMutableArray *data = [NSMutableArray array];
            for (NSDictionary *dic in featuredCourses) {
                ZCourse *course = [[ZCourse alloc] initWithDic:dic];
                [data addObject:course];
            }
            vc.featuredCourses = data;
        }
        
        if (featuredPartners) {
            NSMutableArray *data = [NSMutableArray array];
            for (NSDictionary *dic in featuredPartners) {
                ZPartner *partner = [[ZPartner alloc] initWithDic:dic];
                [data addObject:partner];
            }
            vc.featuredPartners = data;
        }
        
        if (categories) {
            NSMutableArray *data = [NSMutableArray array];
            for (NSDictionary *dic in categories) {
                ZCategory *category = [[ZCategory alloc] initWithDic:dic];
                [data addObject:category];
            }
            vc.categories = data;
        }
        
    } else {
        [SVProgressHUD showErrorWithStatus:@"Error"];
    }
}

@end
