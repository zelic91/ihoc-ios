//
//  ZUser.h
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZUser : NSObject

@property (nonatomic      ) NSInteger id;
@property (copy, nonatomic) NSString  *email;
@property (copy, nonatomic) NSString  *password;
@property (copy, nonatomic) NSString  *confirmedPassword;
@property (copy, nonatomic) NSString  *authenticationToken;
@property (copy, nonatomic) NSString  *avatar;
@property (copy, nonatomic) NSString  *firstName;
@property (copy, nonatomic) NSString  *lastName;
@property (copy, nonatomic) NSString  *city;
@property (copy, nonatomic) NSString  *address;
@property (copy, nonatomic) NSString  *phone;
@property (nonatomic      ) NSInteger createdAt;
@property (nonatomic      ) NSInteger updatedAt;

- (id)initWithDic:(NSDictionary *)dic;
@end
