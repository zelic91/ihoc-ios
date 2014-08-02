//
//  ZFeaturedCourse.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZFeaturedCourse.h"

@interface ZFeaturedCourse()
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIImageView *courseImage;
@property (weak, nonatomic) IBOutlet UIImageView *fadeImage;
@property (weak, nonatomic) IBOutlet UILabel *lbPartnerName;
@property (weak, nonatomic) IBOutlet UILabel *lbPrice;
@property (weak, nonatomic) IBOutlet UILabel *lbCourseName;
@end

@implementation ZFeaturedCourse

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"ZFeaturedCourse" owner:self options:nil];
        [self addSubview:_view];
        [self initStyle];
    }
    return self;
}

- (void)initStyle
{
    _lbCourseName.font = kFontSemiBold(14);
    _lbPartnerName.font = kFontLight(12);
    _lbPrice.font = kFontSemiBold(12);
    _lbPartnerName.textColor = kColorGrayTextLight;
    _lbPrice.textColor = kColorGreen;
}

- (void)setCourse:(ZCourse *)course
{
    _course = course;
    _lbCourseName.text = course.name;
    _lbPartnerName.text = course.partner.name;
    
    if (course.price != (NSNumber *)[NSNull null]) {
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setGroupingSeparator:[[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator]];
        [numberFormatter setGroupingSize:3];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        NSString *price = [numberFormatter stringFromNumber:course.price];
        NSLog(@"Number: %@", price);
        _lbPrice.text = [NSString stringWithFormat:@"%@ VNĐ", price];
    } else {
        _lbPrice.text = @"Không xác định";
    }
    [_courseImage setImageFromURL:[NSURL URLWithString:course.image]];
}

@end
