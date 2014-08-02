//
//  ZCoursePathTableViewCell.m
//  iHoc
//
//  Created by Zelic on 8/2/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZCoursePathTableViewCell.h"

@interface ZCoursePathTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImage;
@property (weak, nonatomic) IBOutlet UILabel *coursePathName;
@end

@implementation ZCoursePathTableViewCell

- (void)setCoursePath:(ZCoursePath *)coursePath
{
    _coursePath = coursePath;
    _coursePathName.text = _coursePath.name;
    [_thumbnailImage setImageFromURL:[NSURL URLWithString:_coursePath.image]];
}

- (void)initStyle
{
    _coursePathName.font = kFontSemiBold(14);
    _thumbnailImage.layer.cornerRadius = _thumbnailImage.frame.size.width/2;
    [_thumbnailImage.layer masksToBounds];
}

@end
