//
//  ZPartnersViewController.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZPartnersViewController.h"
#import "ZPartnerCollectionViewCell.h"

#define kCellId @"PartnerCellId"
@interface ZPartnersViewController ()

@end

@implementation ZPartnersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Nav Bar Delegate
- (void)leftButtonDidTouch:(UIButton *)button
{
}

#pragma mark - CollectionView Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZPartnerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    [cell initStyle];
    return cell;
}


@end
