//
//  ZCourse.h
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCourse : NSObject

@property (nonatomic            ) NSInteger   id;
@property (copy, nonatomic      ) NSString    *name;
@property (nonatomic            ) ZPartner    *partner;
@property (nonatomic            ) NSInteger   startDate;
@property (nonatomic            ) NSInteger   endDate;
@property (copy, nonatomic      ) NSNumber    *duration;
@property (copy, nonatomic      ) NSString    *durationUnit;
@property (copy, nonatomic      ) NSString    *schedule;
@property (copy, nonatomic      ) NSNumber    *price;
@property (copy, nonatomic      ) NSString    *description;
@property (copy, nonatomic      ) NSString    *summary;
@property (copy, nonatomic      ) NSString    *image;
@property (copy, nonatomic      ) NSString    *courseURL;
@property (copy, nonatomic      ) NSString    *syllabus;
@property (copy, nonatomic      ) NSString    *level;
@property (copy, nonatomic      ) NSNumber    *score;
@property (copy, nonatomic      ) ZCategory   *category;
@property (copy, nonatomic      ) NSMutableArray     *path;
@property (copy, nonatomic      ) NSString    *tags;
@property (copy, nonatomic      ) NSString    *instructor;
@property (nonatomic            ) NSInteger   createdAt;
@property (nonatomic            ) NSInteger   updatedAt;

- (id)initWithDic:(NSDictionary *)dic;

@end
