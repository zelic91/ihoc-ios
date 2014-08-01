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


@end
