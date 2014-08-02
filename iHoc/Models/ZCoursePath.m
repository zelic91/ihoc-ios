//
//  ZCoursePath.m
//  iHoc
//
//  Created by Zelic on 8/2/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZCoursePath.h"

@implementation ZCoursePath
- (id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        _id = [[dic objectForKey:@"id"] integerValue];
        _name = [dic objectForKey:@"name"];
        _image = [dic objectForKey:@"image"];
    }
    return self;
}
@end
