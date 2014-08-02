//
//  ZBorderedView.m
//  iHoc
//
//  Created by Zelic on 8/2/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZBorderedView.h"

@implementation ZBorderedView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initStyle];
    }
    return self;
}

- (void)initStyle
{
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 5;
    [self.layer masksToBounds];
}

@end
