//
//  ZDashboardViewController.h
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDashboardViewController : ZBaseViewController<UITableViewDataSource, UITableViewDelegate, ZScrollViewDataSource, ZScrollViewDelegate, ZNavDelegate>
@property (strong, nonatomic) NSArray *sponsoredCourses;
@property (strong, nonatomic) NSArray *featuredCourses;
@property (strong, nonatomic) NSArray *featuredPartners;
@property (strong, nonatomic) NSArray *categories;

@end
