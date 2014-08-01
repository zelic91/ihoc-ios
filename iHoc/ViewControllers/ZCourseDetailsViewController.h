//
//  ZCourseDetailsViewController.h
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCourseDetailsViewController : ZBaseViewController<ZNavDelegate>
@property (strong, nonatomic) ZCourse *course;
@end
