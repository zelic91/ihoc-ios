//
//  ZPartnerCollectionViewCell.h
//  iHoc
//
//  Created by Zelic on 8/2/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPartnerCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) ZPartner *partner;
- (void)initStyle;

@end
