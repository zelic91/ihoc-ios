//
//  ZBookmarksViewController.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZBookmarksViewController.h"
#import "ZCourseDetailsViewController.h"
#import "ZCourseTableViewCell.h"


#define kCellId @"CourseCellId"
#define kSegueDetails @"FromBookmarksToDetails"
@interface ZBookmarksViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *courses;
@end

@implementation ZBookmarksViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
    
    [self setLeftNavButton:[UIImage imageNamed:@"back"]];
    [self initStyle];
    [self initData];
}

- (void)initStyle
{
    _tableView.backgroundColor = kColorGrayListBackground;
}

- (void)initData
{
    [SVProgressHUD showWithStatus:@"Loading ..."];
    [ApplicationDelegate.networkEngine getCourses:1 completion:^(NSArray *data) {
        [SVProgressHUD dismiss];
        _courses = data;
        [_tableView reloadData];
    } failure:^(NSArray *data, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"Error"];
    }];
}

#pragma mark - Nav bar delegate
- (void)leftButtonDidTouch:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_courses) {
        return _courses.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZCourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    [cell initStyle];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setCourse:_courses[indexPath.row]];
    return cell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:kSegueDetails sender:_courses[indexPath.row]];
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
