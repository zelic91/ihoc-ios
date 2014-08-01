//
//  ZBookmarksViewController.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZBookmarksViewController.h"
#import "ZCourseTableViewCell.h"


#define kCellId @"CourseCellId"
@interface ZBookmarksViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ZBookmarksViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    
    [self setLeftNavButton:[UIImage imageNamed:@"back"]];
    
    [self initStyle];
}

- (void)initStyle
{
    _tableView.backgroundColor = kColorGrayListBackground;
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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZCourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    [cell initStyle];
    return cell;
}

#pragma mark - TableView Delegate


@end
