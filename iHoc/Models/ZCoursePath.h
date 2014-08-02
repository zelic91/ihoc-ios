//
//  ZCoursePath.h
//  iHoc
//
//  Created by Zelic on 8/2/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCoursePath : NSObject
@property (nonatomic) NSInteger id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *image;
- (id)initWithDic:(NSDictionary *)dic;
@end
