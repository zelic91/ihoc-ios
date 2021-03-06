//
//  ZDashboardViewController.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZDashboardViewController.h"
#import "ZCourseDetailsViewController.h"
#import "ZCoursesViewController.h"
#import "ZBookmarksViewController.h"
#import "ZPartnersViewController.h"
#import "ZCategoryTableViewCell.h"
#import "ZSponsoredView.h"
#import "ZFeaturedCourse.h"
#import "ZFeaturedPartner.h"

#define kCellId         @"CategoryCellId"
#define kSegueCourses   @"FromDashboardToCourses"
#define kSeguePartners  @"FromDashboardToPartners"
#define kSegueBookmarks @"FromDashboardToBookmarks"
#define kSegueDetails   @"FromDashboardToDetails"

@interface ZDashboardViewController ()
@property (weak, nonatomic) IBOutlet ZScrollView *svSponsored;
@property (weak, nonatomic) IBOutlet ZScrollView *svFeaturedCourses;
@property (weak, nonatomic) IBOutlet ZScrollView *svFeaturedPartners;
@property (weak, nonatomic) IBOutlet UITableView *tvCategories;
@property (weak, nonatomic) IBOutlet UILabel *lbFeaturedCourses;
@property (weak, nonatomic) IBOutlet UIButton *btnAllCourses;
@property (weak, nonatomic) IBOutlet UILabel *lbFeaturedPartners;
@property (weak, nonatomic) IBOutlet UIButton *btnAllPartners;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTableViewHeight;
@end

@implementation ZDashboardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initStyle];
    self.delegate = self;
    
    _svSponsored.scrollDataSource = self;
    _svSponsored.pagingEnabled = YES;
    _svSponsored.scrollDelegate = self;
    _svSponsored.bounces = NO;
    
    _svFeaturedCourses.scrollDataSource = self;
    _svFeaturedCourses.scrollDelegate = self;
    _svFeaturedCourses.space = 20;
    
    _svFeaturedPartners.scrollDataSource = self;
    _svFeaturedPartners.scrollDelegate = self;
    _svFeaturedPartners.space = 20;
}

- (void)viewWillAppear:(BOOL)animated
{
    _constraintTableViewHeight.constant = kCategoryCellHeight * [_tvCategories numberOfRowsInSection:0];
}

- (void)initStyle
{
    _lbFeaturedPartners.font = kFontSemiBold(16);
    _lbFeaturedCourses.font = kFontSemiBold(16);
    _btnAllCourses.titleLabel.font = kFontSemiBold(13);
    _btnAllPartners.titleLabel.font = kFontSemiBold(13);
    [_btnAllCourses setTitleColor:kColorGreen forState:UIControlStateNormal];
    [_btnAllPartners setTitleColor:kColorGreen forState:UIControlStateNormal];
    
    _tvCategories.scrollEnabled = NO;
    
    [self setLeftNavButton:[UIImage imageNamed:@"bookmark"]];
}

#pragma mark - Handle nav button click
- (void)leftButtonDidTouch:(UIButton *)button
{
    [self performSegueWithIdentifier:kSegueBookmarks sender:self];
}

#pragma mark - ZScrollView DataSource
- (NSInteger)numberOfItemsInScrollView:(ZScrollView *)scrollView
{
    if (scrollView == _svSponsored) {
        return _sponsoredCourses.count;
    } else if (scrollView == _svFeaturedCourses) {
        return _featuredCourses.count;
    } else if (scrollView == _svFeaturedPartners) {
        return _featuredPartners.count;
    }
    return 0;
}

- (UIView *)scrollView:(ZScrollView *)scrollView viewForItemAtIndex:(NSInteger)index
{
    if (scrollView == _svSponsored) {
        ZSponsoredView *view = [[ZSponsoredView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        [view setCourse:_sponsoredCourses[index]];
        return view;
    } else if (scrollView == _svFeaturedCourses) {
        ZFeaturedCourse *view = [[ZFeaturedCourse alloc] initWithFrame:CGRectMake(0, 0, 100, 120)];
        [view setCourse:_featuredCourses[index]];
        return view;
    } else if (scrollView == _svFeaturedPartners) {
        ZFeaturedPartner *view = [[ZFeaturedPartner alloc] initWithFrame:CGRectMake(0, 0, 100, 120)];
        [view setPartner:_featuredPartners[index]];
        return view;
    }
    return nil;
}

#pragma mark - ZScrollView Delegate
- (void)scrollView:(ZScrollView *)scrollView didSelectItemAtIndex:(NSInteger)index
{
    if (scrollView == _svSponsored) {
        [self performSegueWithIdentifier:kSegueDetails sender:_sponsoredCourses[index]];
    } else if (scrollView == _svFeaturedCourses) {
        [self performSegueWithIdentifier:kSegueDetails sender:_featuredCourses[index]];
    } else if (scrollView == _svFeaturedPartners) {
        [self performSegueWithIdentifier:kSegueCourses sender:_featuredPartners[index]];
    }
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_categories) {
        return _categories.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    [cell initStyle];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.category = _categories[indexPath.row];
    return cell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:kSegueCourses sender:self];
}

#pragma mark - Handle button click
- (IBAction)allCoursesButtonDidTouch:(id)sender
{
    [self performSegueWithIdentifier:kSegueCourses sender:self];
}


- (IBAction)allPartnersButtonDidTouch:(id)sender
{
    [self performSegueWithIdentifier:kSeguePartners sender:self];
}

#pragma mark - Prepare for segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:kSegueDetails]) {
        ZCourseDetailsViewController *vc = (ZCourseDetailsViewController *)segue.destinationViewController;
        vc.course = sender;
    }
}



@end
