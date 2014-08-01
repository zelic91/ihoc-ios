//
//  ZCategory.h
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCategory : NSObject

@property (nonatomic) NSInteger id;
@property (copy, nonatomic) NSString *name;
@property (nonatomic) NSInteger parentId;
@property (nonatomic) NSInteger createdAt;
@property (nonatomic) NSInteger updatedAt;

- (id)initWithDic:(NSDictionary *)dic;

@end
