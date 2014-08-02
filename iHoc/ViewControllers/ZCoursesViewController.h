//
//  ZCoursesViewController.h
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCoursesViewController : ZBaseViewController<UITableViewDataSource, UITableViewDelegate, ZNavDelegate>
@property (strong, nonatomic) ZPartner  *partner;
@property (strong, nonatomic) ZCategory *category;
@end
