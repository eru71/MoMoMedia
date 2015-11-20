//
//  SearchViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchMainViewController.h"
@interface SearchViewController ()

@property (nonatomic,strong) UITextField *textField;

@end

@implementation SearchViewController

+(SearchViewController *)standardNavi{
    static SearchViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [SearchViewController new];
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.translucent = NO;
    self.tabBar.backgroundColor = [UIColor blackColor];
    SearchMainViewController *cvc = [SearchMainViewController new];
    UINavigationController *ncvc = [[UINavigationController alloc]initWithRootViewController:cvc];
    cvc.title = @"搜索";
    ncvc.title = @"搜索";
    
    self.viewControllers = @[ncvc];
}

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

- (UITextField *)textField {
	if(_textField == nil) {
		_textField = [[UITextField alloc] init];
        [self.view addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.height.mas_equalTo(40);
            make.width.mas_equalTo(200);
        }];
        
        _textField.placeholder = @"在这儿输入(^ ^)";
//        _textField.borderStyle = style
	}
	return _textField;
}

@end
