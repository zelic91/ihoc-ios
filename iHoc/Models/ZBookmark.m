//
//  ZBookmark.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZBookmark.h"

@implementation ZBookmark

- (id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        _id        = [[dic objectForKey:@"id"] integerValue];
        _courseId  = [[dic objectForKey:@"course_id"] integerValue];
        _userId    = [[dic objectForKey:@"user_id"] integerValue];
        _note      = [dic objectForKey:@"note"];
        _createdAt = [[dic objectForKey:@"created_at"] integerValue];
        _updatedAt = [[dic objectForKey:@"updated_at"] integerValue];
    }
    return self;
}

@end
