//
//  XInputViewController.m
//  XApp
//
//  Created by viviwu on 2019/8/8.
//  Copyright © 2019 vivi wu. All rights reserved.
//

#import "XInputViewController.h"


#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH  [UIScreen mainScreen].bounds.size.height

#define kSelfViewW  self.view.bounds.size.width
#define kSelfViewH  self.view.bounds.size.height

@interface XInputViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIView *emotionView;
@property (weak, nonatomic) IBOutlet UIToolbar *editToolBar;

@end

@implementation XInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // listen for when Keyboard show or down to adjust editeditToolBar
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    CGFloat safeBottomH = 0;
    if (@available(iOS 11.0, *)) {
        safeBottomH = self.view.safeAreaInsets.bottom;
    } else {
        // Fallback on earlier versions
    }
    CGRect rect = self.editToolBar.frame;
    rect.origin.y = kSelfViewH - rect.size.height - safeBottomH;
    self.editToolBar.frame = rect;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    // we are no longer interested in these notifications
    [NSNotificationCenter.defaultCenter removeObserver:self];
}


#pragma mark -- 键盘 Keyboard Show or Hidden
- (void)keyboardWillShow:(NSNotification *)notification
{
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect keyboardRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];//获取键盘的高度
    CGRect rect = self.editToolBar.frame;
    rect.origin.y = kSelfViewH - rect.size.height - keyboardRect.size.height;
    [UIView animateWithDuration:duration animations:^{
        self.editToolBar.frame = rect;
    }];
}

- (void)keyboardDidHide:(NSNotification *)notification{
    CGFloat safeBottomH = 0;
    if (@available(iOS 11.0, *)) {
        safeBottomH = self.view.safeAreaInsets.bottom;
    } else {
        // Fallback on earlier versions
    }
    CGRect rect = self.editToolBar.frame;
    rect.origin.y = kSelfViewH - rect.size.height - safeBottomH;
    
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration animations:^{
        self.editToolBar.frame = rect;
    }];
}

- (IBAction)switchKeyboard:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.textField.inputView = self.emotionView;
        
    }else
        self.textField.inputView = nil;
    
    [self.textField reloadInputViews];
}

- (IBAction)actionOne:(id)sender {
    
}

- (IBAction)actionTwo:(id)sender {
    
}

- (IBAction)emotionChanged:(id)sender {
    NSString * str = [NSString stringWithString:self.textField.text];
    self.textField.text = [str stringByAppendingFormat:@"%@", @"😊"];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
