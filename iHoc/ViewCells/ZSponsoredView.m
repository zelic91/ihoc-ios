//
//  ZSponsoredView.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZSponsoredView.h"

@interface ZSponsoredView()
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIImageView *courseImage;
@property (weak, nonatomic) IBOutlet UIImageView *fadeImage;
@property (weak, nonatomic) IBOutlet UILabel *lbCourseName;

@end

@implementation ZSponsoredView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"ZSponsoredView" owner:self options:nil];
        [self addSubview:_view];
        [self initStyle];
        
    }
    return self;
}

- (void)initStyle
{
    _lbCourseName.font = kFontBold(22);
}

- (void)setCourse:(ZCourse *)course
{
    _course = course;
    _lbCourseName.text = course.name;
    [_courseImage setImageFromURL:[NSURL URLWithString:course.image]];
}

@end
