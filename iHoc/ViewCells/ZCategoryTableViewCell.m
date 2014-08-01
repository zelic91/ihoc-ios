//
//  ZCategoryTableViewCell.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZCategoryTableViewCell.h"

@interface ZCategoryTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *categoryName;
@end

@implementation ZCategoryTableViewCell

- (void)initStyle
{
    _categoryName.font = kFontSemiBold(16);
    _categoryName.textColor = kColorGreen;
}

- (void)setCategory:(ZCategory *)category
{
    _categoryName.text = category.name;
}

@end
