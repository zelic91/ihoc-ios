//
//  ZPartner.h
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZPartner : NSObject

@property (nonatomic) NSInteger id;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *email;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSString *website;
@property (copy, nonatomic) NSString *description;
@property (copy, nonatomic) NSString *image;
@property (copy, nonatomic) NSString *phone;
@property (nonatomic) NSInteger createdAt;
@property (nonatomic) NSInteger updatedAt;

- (id)initWithDic:(NSDictionary *)dic;

@end
