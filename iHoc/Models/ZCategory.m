//
//  ZCategory.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZCategory.h"

@implementation ZCategory

- (id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        _id        = [[dic objectForKey:@"id"] integerValue];
        _name      = [dic objectForKey:@"name"];
        _parentId  = [[dic objectForKey:@"parent_category_id"] integerValue];
        _createdAt = [[dic objectForKey:@"created_at"] integerValue];
        _updatedAt = [[dic objectForKey:@"updated_at"] integerValue];
    }
    return self;
}

@end
