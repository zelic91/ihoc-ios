//
//  ZPartnerCollectionViewCell.m
//  iHoc
//
//  Created by Zelic on 8/2/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZPartnerCollectionViewCell.h"

@interface ZPartnerCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *partnerImage;
@property (weak, nonatomic) IBOutlet UILabel *partnerName;

@end

@implementation ZPartnerCollectionViewCell

- (void)setPartner:(ZPartner *)partner
{
    _partner = partner;
    [_partnerImage setImageFromURL:[NSURL URLWithString:partner.image]];
    _partnerName.text = partner.name;
    
}

- (void)initStyle
{
    _partnerName.font = kFontBold(18);
}

@end
