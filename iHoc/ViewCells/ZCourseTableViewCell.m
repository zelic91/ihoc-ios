//
//  ZCourseTableViewCell.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZCourseTableViewCell.h"

@interface ZCourseTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UIImageView *courseImage;
@property (weak, nonatomic) IBOutlet UILabel *lbCourseName;
@property (weak, nonatomic) IBOutlet UILabel *lbPriceTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbDurationTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbDuration;
@property (weak, nonatomic) IBOutlet UILabel *lbStartDateTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbStartDate;
@property (weak, nonatomic) IBOutlet UILabel *lbPrice;
@end

@implementation ZCourseTableViewCell

- (void)setCourse:(ZCourse *)course
{
    _course = course;
    [_courseImage setImageFromURL:[NSURL URLWithString:_course.image]];
    _lbCourseName.text = _course.name;
    _lbDuration.text = [NSString stringWithFormat:@"%@ %@", _course.duration, _course.durationUnit];
    _lbStartDate.text = [ZDateTimeUtil getDisplayDateStringFromTimeStamp:_course.startDate];
    if (_course.price != (NSNumber *)[NSNull null]) {
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        _lbPrice.text = [NSString stringWithFormat:@"%@ VNĐ", [numberFormatter stringFromNumber:_course.price]];
    } else {
        _lbPrice.text = @"Không xác định";
    }
}

- (void)initStyle
{
    _cardView.layer.shadowColor = kColorGrayTextDark.CGColor;
    _cardView.layer.shadowOffset = CGSizeMake(0, 0.5);
    _cardView.layer.shadowOpacity = 0.5;
    _cardView.layer.shadowRadius = 0.6;
    _cardView.layer.masksToBounds = NO;
    self.contentView.backgroundColor = kColorGrayListBackground;
    _lbPriceTitle.textColor = kColorGrayTextLight;
    _lbPriceTitle.font = kFontLight(12);
    _lbDurationTitle.textColor = kColorGrayTextLight;
    _lbDurationTitle.font = kFontLight(12);
    _lbStartDateTitle.textColor = kColorGrayTextLight;
    _lbStartDateTitle.font = kFontLight(12);
    _lbCourseName.font = kFontBold(18);
    _lbPrice.font = kFontSemiBold(14);
    _lbPrice.textColor = kColorGreen;
    _lbDuration.font = kFontSemiBold(14);
    _lbDuration.textColor = kColorGrayTextDark;
    _lbStartDate.font = kFontSemiBold(14);
    _lbStartDate.textColor = kColorGrayTextDark;
    
}

- (void)prepareForReuse
{

}

@end
