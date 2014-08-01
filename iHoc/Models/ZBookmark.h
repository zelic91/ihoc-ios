//
//  ZBookmark.h
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBookmark : NSObject

@property (nonatomic) NSInteger id;
@property (nonatomic) NSInteger courseId;
@property (nonatomic) NSInteger userId;
@property (copy, nonatomic) NSString *note;
@property (nonatomic) NSInteger createdAt;
@property (nonatomic) NSInteger updatedAt;

- (id)initWithDic:(NSDictionary *)dic;

@end
