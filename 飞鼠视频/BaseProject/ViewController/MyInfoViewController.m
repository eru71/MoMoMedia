//
//  MyInfoViewController.m
//  BaseProject
//
//  Created by eru71 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MyInfoViewController.h"
#import "HomeUserInfo.h"
#import "LoginViewController.h"

@interface MyInfoViewController ()

@end

@implementation MyInfoViewController

+(MyInfoViewController *)standardVC{
    static MyInfoViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"MyInfoViewController"];
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    HomeUserInfo *userModel = [HomeUserInfo new];
    if ([[NSFileManager defaultManager] fileExistsAtPath:user_data]) {
        NSDictionary *userInfo = [NSDictionary dictionaryWithContentsOfFile:user_data];
        
        [userModel setValuesForKeysWithDictionary:userInfo];
        NSLog(@"model.name=%@,model.userFollowing=%@",userModel.name,userModel.userFollowing);
    }else{
        UIStoryboard *mainstoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *vc = [mainstoryBoard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
}
- (IBAction)toLogin:(id)sender {
    UIStoryboard *mainstoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *vc = [mainstoryBoard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:vc animated:YES completion:nil];
    
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

@end
