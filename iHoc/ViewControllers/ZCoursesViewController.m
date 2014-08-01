//
//  ZCoursesViewController.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZCoursesViewController.h"
#import "ZCourseTableViewCell.h"

#define kCellId @"CourseCellId"
#define kSegueDetails @"FromCoursesToDetails"
@interface ZCoursesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ZCoursesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    _tableView.backgroundColor = kColorGrayListBackground;
    
    [self setLeftNavButton:[UIImage imageNamed:@"back"]];
}

#pragma mark - Nav Delegate
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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZCourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    [cell initStyle];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:kSegueDetails sender:self];
}


#pragma mark - Button click handler

@end
