//
//  SearchMainViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchMainViewController.h"
#import "SearchResultViewController.h"

@interface SearchMainViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *searchTextField;

@end

@implementation SearchMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    UITextField *searchTextField = [[UITextField alloc]initWithFrame:CGRectMake(kWindowW/2-100, kWindowH/3-20, 200, 40)];
    searchTextField.backgroundColor = [UIColor greenSeaColor];
    searchTextField.borderStyle = UITextBorderStyleRoundedRect;
    searchTextField.placeholder = @"在这儿输入哦";
    [self.view addSubview:searchTextField];
    self.searchTextField = searchTextField;
    self.searchTextField.delegate = self;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self showSuccessMsg:@"请稍等"];
    [self.searchTextField resignFirstResponder];
    SearchResultViewController *vc = [[SearchResultViewController alloc]initWithKeyword:textField.text];
    vc.title = [NSString stringWithFormat:@"搜索结果:%@",textField.text];
    [self.navigationController pushViewController:vc animated:YES];
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self becomeFirstResponder];
//    [self showSuccessMsg:@"正在输入"];
}

//-(void)textFieldDidEndEditing:(UITextField *)textField{
//    [self resignFirstResponder];
//    [self showSuccessMsg:@"输入完毕"];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
