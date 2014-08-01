//
//  ZPartner.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZPartner.h"

@implementation ZPartner

- (id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        _id = [[dic objectForKey:@"id"] integerValue];
        _name = [dic objectForKey:@"name"];
        _email = [dic objectForKey:@"email"];
        _address = [dic objectForKey:@"address"];
        _website = [dic objectForKey:@"website"];
        _description = [dic objectForKey:@"description"];
        _image = [dic objectForKey:@"image"];
        _phone = [dic objectForKey:@"phone"];
        _createdAt = [[dic objectForKey:@"created_at"] integerValue];
        _updatedAt = [[dic objectForKey:@"updated_at"] integerValue];
    }
    return self;
}

@end
