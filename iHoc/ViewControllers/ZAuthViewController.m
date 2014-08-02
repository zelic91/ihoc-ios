//
//  ZAuthViewController.m
//  iHoc
//
//  Created by Zelic on 8/1/14.
//  Copyright (c) 2014 Zelic. All rights reserved.
//

#import "ZAuthViewController.h"

@interface ZAuthViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *svSignIn;
@property (weak, nonatomic) IBOutlet UIScrollView *svSignUp;
@property (weak, nonatomic) IBOutlet UITextField *signInEmail;
@property (weak, nonatomic) IBOutlet UITextField *signInPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnSignIn;
@property (weak, nonatomic) IBOutlet UIButton *btnToSignUp;
@property (weak, nonatomic) IBOutlet UITextField *signUpEmail;
@property (weak, nonatomic) IBOutlet UITextField *signUpPassword;
@property (weak, nonatomic) IBOutlet UITextField *signUpPasswordConfirmation;
@property (weak, nonatomic) IBOutlet UITextField *signUpPhone;
@property (weak, nonatomic) IBOutlet UIButton *btnSignUp;
@property (weak, nonatomic) IBOutlet UIButton *btnToSignIn;
@end

@implementation ZAuthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initStyle];
}

- (void)initStyle
{
    _signInEmail.font = kFontSemiBold(16);
    _signInPassword.font = kFontSemiBold(16);
    _signUpEmail.font = kFontSemiBold(16);
    _signUpPassword.font = kFontSemiBold(16);
    _signUpPasswordConfirmation.font = kFontSemiBold(16);
    _signUpPhone.font = kFontSemiBold(16);
    _btnToSignIn.titleLabel.font = kFontLight(16);
    [_btnToSignIn setTitleColor:kColorGreen forState:UIControlStateNormal];
    _btnToSignUp.titleLabel.font = kFontLight(16);
    [_btnToSignUp setTitleColor:kColorGreen forState:UIControlStateNormal];
    _btnSignIn.titleLabel.font = kFontBold(18);
    _btnSignIn.backgroundColor = kColorGreen;
    _btnSignUp.titleLabel.font = kFontBold(18);
    _btnSignUp.backgroundColor = kColorGreen;
    
    _btnSignIn.layer.cornerRadius = 5;
    [_btnSignIn.layer masksToBounds];
    _btnSignUp.layer.cornerRadius = 5;
    [_btnSignUp.layer masksToBounds];
}

- (IBAction)signUpDidTouch:(id)sender
{
    [_svSignUp endEditing:YES];
}

- (IBAction)signInDidTouch:(id)sender
{
    [_svSignIn endEditing:YES];
}

#pragma mark - Handle Button Click
- (IBAction)signUpButtonDidTouch:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)toSignInButtonDidTouch:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        _svSignIn.alpha = 1;
        _svSignUp.alpha = 0;
    }];
}


- (IBAction)signInButtonDidTouch:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)toSignUpButtonDidTouch:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        _svSignIn.alpha = 0;
        _svSignUp.alpha = 1;
    }];
}

- (IBAction)backButtonDidTouch:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
