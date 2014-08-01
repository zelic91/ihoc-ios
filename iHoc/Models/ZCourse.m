//
//  ZCourse.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZCourse.h"

@implementation ZCourse

- (id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        _id           = [[dic objectForKey:@"id"] integerValue];
        _name         = [dic objectForKey:@"name"];
        _partnerId    = [[dic objectForKey:@"partner_id"] integerValue];
        _categoryId   = [[dic objectForKey:@"category_id"] integerValue];
        _startDate    = [[dic objectForKey:@"start_date"] integerValue];
        _endDate      = [[dic objectForKey:@"end_date"] integerValue];
        _duration     = [dic objectForKey:@"duration"];
        _durationUnit = [dic objectForKey:@"duration_unit"];
        _schedule     = [dic objectForKey:@"schedule"];
        _price        = [dic objectForKey:@"price"];
        _description  = [dic objectForKey:@"description"];
        _summary      = [dic objectForKey:@"summary"];
        _image        = [dic objectForKey:@"image"];
        _courseURL    = [dic objectForKey:@"course_url"];
        _syllabus     = [dic objectForKey:@"syllabus"];
        _level        = [dic objectForKey:@"level"];
        _score        = [dic objectForKey:@"score"];
        _tags         = [dic objectForKey:@"tags"];
        _instructor   = [dic objectForKey:@"instructor"];
        _createdAt    = [[dic objectForKey:@"created_at"] integerValue];
        _updatedAt    = [[dic objectForKey:@"updated_at"] integerValue];
    }
    return self;
}

@end
