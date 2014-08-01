//
//  ZUser.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZUser.h"

@implementation ZUser

- (id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        _id                  = [[dic objectForKey:@"id"] integerValue];
        _email               = [dic objectForKey:@"email"];
        _authenticationToken = [dic objectForKey:@"authentication_token"];
        _avatar              = [dic objectForKey:@"avatar"];
        _firstName           = [dic objectForKey:@"first_name"];
        _lastName            = [dic objectForKey:@"last_name"];
        _city                = [dic objectForKey:@"city"];
        _address             = [dic objectForKey:@"address"];
        _phone               = [dic objectForKey:@"phone"];
        _createdAt           = [[dic objectForKey:@"created_at"] integerValue];
        _updatedAt           = [[dic objectForKey:@"updated_at"] integerValue];
    }
    
    return self;
}

@end
