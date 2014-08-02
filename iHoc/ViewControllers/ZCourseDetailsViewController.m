//
//  ZCourseDetailsViewController.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZCourseDetailsViewController.h"
#import "ZCoursePathTableViewCell.h"


#define kCellId @"CoursePathCellId"
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
@property (weak, nonatomic) IBOutlet UIView *viewDescription;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintDescriptionHeight;

@property (weak, nonatomic) IBOutlet UILabel *lbScheduleTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbSchedule;
@property (weak, nonatomic) IBOutlet UIView *viewSchedule;


@property (weak, nonatomic) IBOutlet UILabel *lbSyllabusTitle;
@property (weak, nonatomic) IBOutlet RTLabel *rtSyllabus;
@property (weak, nonatomic) IBOutlet UIView *viewSyllabus;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintSyllabusHeight;

@property (weak, nonatomic) IBOutlet UILabel *lbCoursePathTitle;
@property (weak, nonatomic) IBOutlet UITableView *tableViewCoursePath;
@property (weak, nonatomic) IBOutlet UIView *viewCoursePath;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTableViewCoursePath;

@property (weak, nonatomic) IBOutlet UILabel *lbAdditional;
@property (weak, nonatomic) IBOutlet UILabel *lbInstructorTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbInstructor;
@property (weak, nonatomic) IBOutlet UILabel *lbCategoryTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbCategory;
@property (weak, nonatomic) IBOutlet UIView *viewAdditional;

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

- (void)viewDidAppear:(BOOL)animated
{
    _constraintTableViewCoursePath.constant = 44 * [_tableViewCoursePath numberOfRowsInSection:0];
}

- (void)initStyle
{
    [_btnRegister setBackgroundColor:kColorGreen];
    _btnRegister.layer.cornerRadius = 5;
    [_btnRegister clipsToBounds];
    _btnRegister.titleLabel.font = kFontBold(22);
    
    _mainScrollView.contentInset = UIEdgeInsetsMake(0, 0, 90, 0);
    
    _tableViewCoursePath.scrollEnabled = NO;
    
    //Fonts and color
    
    _lbCourseName.font     = kFontBold(22);
    _lbPartnerName.font    = kFontSemiBold(16);
    _lbPartnerName.textColor = kColorGrayTextLight;
    _lbPriceTitle.font     = kFontLight(14);
    _lbPrice.font          = kFontSemiBold(14);
    _lbPrice.textColor     = kColorGreen;
    _lbDurationTitle.font  = kFontLight(14);
    _lbDuration.font       = kFontSemiBold(14);
    _lbStartDateTitle.font = kFontLight(14);
    _lbStartDate.font      = kFontSemiBold(14);
    
    _lbDescription.font     = kFontSemiBold(18);
    _rtDescription.font     = kFontLight(14);
    _lbScheduleTitle.font   = kFontSemiBold(18);
    _lbSchedule.font        = kFontLight(14);
    _lbSyllabusTitle.font   = kFontSemiBold(18);
    _rtSyllabus.font        = kFontLight(14);
    _lbCoursePathTitle.font = kFontSemiBold(18);
    _lbAdditional.font      = kFontSemiBold(18);
    _lbInstructorTitle.font = kFontSemiBold(14);
    _lbInstructor.font      = kFontLight(14);
    _lbCategoryTitle.font   = kFontSemiBold(14);
    _lbCategory.font        = kFontLight(14);
    
    //Apply shadow
    [self applyShadow:_viewOverview];
    [self applyShadow:_viewDescription];
    [self applyShadow:_viewSchedule];
    [self applyShadow:_viewSyllabus];
    [self applyShadow:_viewCoursePath];
    [self applyShadow:_viewAdditional];
}

- (void)initData
{
    if (_course) {
        [_courseImage setImageFromURL:[NSURL URLWithString:_course.image]];
        _lbCourseName.text                    = _course.name;
        _lbPartnerName.text                   = _course.partner.name;
        _lbDuration.text                      = [NSString stringWithFormat:@"%@ %@", _course.duration, _course.durationUnit];
        _lbStartDate.text                     = [ZDateTimeUtil getDisplayDateStringFromTimeStamp:_course.startDate];
        if (_course.price != (NSNumber *)[NSNull null]) {
            NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
            [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
            _lbPrice.text = [NSString stringWithFormat:@"%@ VNĐ", [numberFormatter stringFromNumber:_course.price]];
        } else {
            _lbPrice.text = @"Không xác định";
        }
        _rtDescription.text                   = _course.description;
        _constraintDescriptionHeight.constant = [_rtDescription optimumSize].height;
        _lbSchedule.text = _course.schedule;
        _rtSyllabus.text = _course.syllabus;
        _constraintSyllabusHeight.constant = [_rtSyllabus optimumSize].height;
        _lbInstructor.text = _course.instructor;
        _lbCategory.text = _course.category.name;
    }
}

#pragma mark - Nav bar button did touch
- (void)leftButtonDidTouch:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)applyShadow:(UIView *)view
{
    view.layer.shadowColor = kColorGrayTextDark.CGColor;
    view.layer.shadowOffset = CGSizeMake(0, 0.5);
    view.layer.shadowOpacity = 0.5;
    view.layer.shadowRadius = 0.6;
    view.layer.masksToBounds = NO;
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_course.path.count>0) {
        return _course.path.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZCoursePathTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    [cell initStyle];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.coursePath = _course.path[indexPath.row];
    return cell;
}

@end
