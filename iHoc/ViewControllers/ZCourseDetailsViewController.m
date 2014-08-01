//
//  ZCourseDetailsViewController.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZCourseDetailsViewController.h"

@interface ZCourseDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIButton *btnRegister;

@property (weak, nonatomic) IBOutlet UIImageView *courseImage;

@property (weak, nonatomic) IBOutlet UIView *viewOverview;
@property (weak, nonatomic) IBOutlet UILabel *lbCourseName;
@property (weak, nonatomic) IBOutlet UILabel *lbPartnerName;
@property (weak, nonatomic) IBOutlet UILabel *lbPriceTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbPrice;
@property (weak, nonatomic) IBOutlet UILabel *lbDurationTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbDuration;
@property (weak, nonatomic) IBOutlet UILabel *lbStartDateTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbStartDate;
@property (weak, nonatomic) IBOutlet UILabel *lbDescription;
@property (weak, nonatomic) IBOutlet RTLabel *rtDescription;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintDescriptionHeight;
@property (weak, nonatomic) IBOutlet UILabel *lbScheduleTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbSchedule;
@property (weak, nonatomic) IBOutlet UILabel *lbSyllabusTitle;
@property (weak, nonatomic) IBOutlet RTLabel *rtSyllabus;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintSyllabusHeight;
@property (weak, nonatomic) IBOutlet UILabel *lbCoursePathTitle;
@property (weak, nonatomic) IBOutlet UITableView *tableViewCoursePath;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTableViewCoursePath;
@property (weak, nonatomic) IBOutlet UILabel *lbAdditional;
@property (weak, nonatomic) IBOutlet UILabel *lbInstructorTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbInstructor;
@property (weak, nonatomic) IBOutlet UILabel *lbCategoryTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbCategory;
@end

@implementation ZCourseDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    [self setLeftNavButton:[UIImage imageNamed:@"back"]];
    
    [self initStyle];
    [self initData];
}

- (void)initStyle
{
    [_btnRegister setBackgroundColor:kColorGreen];
    _btnRegister.layer.cornerRadius = 5;
    [_btnRegister clipsToBounds];
    _btnRegister.titleLabel.font = kFontBold(22);
    
    _mainScrollView.contentInset = UIEdgeInsetsMake(0, 0, 90, 0);
    
    //Fonts and color
    
    _lbCourseName.font     = kFontBold(22);
    _lbPartnerName.font    = kFontSemiBold(16);
    _lbPriceTitle.font     = kFontLight(14);
    _lbPrice.font          = kFontSemiBold(14);
    _lbPrice.textColor     = kColorGreen;
    _lbDurationTitle.font  = kFontLight(14);
    _lbDuration.font       = kFontSemiBold(14);
    _lbStartDateTitle.font = kFontLight(14);
    _lbStartDate.font      = kFontSemiBold(14);
    
    _lbDescription.font = kFontSemiBold(18);
    _rtDescription.font = kFontLight(14);
    _lbScheduleTitle.font = kFontSemiBold(18);
    _lbSchedule.font = kFontLight(14);
    _lbSyllabusTitle.font = kFontSemiBold(18);
    _rtSyllabus.font = kFontLight(14);
    _lbCoursePathTitle.font = kFontSemiBold(18);
    _lbAdditional.font = kFontSemiBold(18);
    _lbInstructorTitle.font = kFontSemiBold(14);
    _lbInstructor.font = kFontLight(14);
    _lbCategoryTitle.font = kFontSemiBold(14);
    _lbCategory.font = kFontLight(14);
}

- (void)initData
{
    _rtDescription.text = @"Sample description";
    _constraintDescriptionHeight.constant = [_rtDescription optimumSize].height;
}

#pragma mark - Nav bar button did touch
- (void)leftButtonDidTouch:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
