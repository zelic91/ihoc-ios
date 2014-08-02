//
//  ZPartnersViewController.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZPartnersViewController.h"
#import "ZPartnerCollectionViewCell.h"

#define kCellId         @"PartnerCellId"
#define kSegueCourses   @"FromPartnersToCourses"
@interface ZPartnersViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *partners;
@end

@implementation ZPartnersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    [self setLeftNavButton:[UIImage imageNamed:@"back"]];
    
    [self initData];
}

- (void)initData
{
    [SVProgressHUD showWithStatus:@"Loading ..."];
    [ApplicationDelegate.networkEngine getPartners:^(NSArray *data) {
        [SVProgressHUD dismiss];
        _partners = data;
        [_collectionView reloadData];
    } failure:^(NSArray *data, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"Error"];
    }];
}

#pragma mark - Nav Bar Delegate
- (void)leftButtonDidTouch:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - CollectionView Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_partners) {
        return _partners.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZPartnerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    [cell initStyle];
    cell.partner = _partners[indexPath.row];
    return cell;
}

#pragma mark - CollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:kSegueCourses sender:self];
}

@end
