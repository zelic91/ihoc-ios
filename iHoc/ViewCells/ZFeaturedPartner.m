//
//  ZFeaturedPartner.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZFeaturedPartner.h"

@interface ZFeaturedPartner()
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIImageView *partnerImage;
@property (weak, nonatomic) IBOutlet UIImageView *fadeImage;
@property (weak, nonatomic) IBOutlet UILabel *lbPartnerName;
@end

@implementation ZFeaturedPartner

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"ZFeaturedPartner" owner:self options:nil];
        
        [self addSubview:_view];
        [self initStyle];
    }
    return self;
}

- (void)initStyle
{
    _lbPartnerName.font = kFontLight(12);
    _lbPartnerName.textColor = kColorGrayTextLight;
}

- (void)setPartner:(ZPartner *)partner
{
    _partner = partner;
    _lbPartnerName.text = partner.name;
    [_partnerImage setImageFromURL:[NSURL URLWithString:partner.image]];
}

@end
