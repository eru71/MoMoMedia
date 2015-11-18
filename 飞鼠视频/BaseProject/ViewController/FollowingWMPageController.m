//
//  FollowingWMPageController.m
//  BaseProject
//
//  Created by Colette71 on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FollowingWMPageController.h"
#import "VideosByUserViewController.h"
#import "UserFollowingViewModel.h"
#import "VideosByUserViewModel.h"
#import "VideosByUserNetModel.h"
#import "VideosByUserModel.h"

@interface FollowingWMPageController ()<UIAlertViewDelegate>

@property (nonatomic,strong) VideosByUserViewModel *vbuVM;

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation FollowingWMPageController

+ (UINavigationController *)standardFollowNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        FollowingWMPageController *vc = [[FollowingWMPageController alloc] initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}

/** 提供每个VC对应的values值数组 */
+ (NSArray *)vcValues{
    NSArray *arr = [self itemNames];
    return arr;

}
//* 提供每个VC对应的key值数组 
+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i<[self itemNames].count; i++) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

/** 提供题目数组 */
+ (NSArray *)itemNames{
//    NSMutableArray *arr = [NSMutableArray new];
//    NSLog(@"%@",user_data);
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:user_data];
    NSArray *array = [dic[@"userFollowing"] componentsSeparatedByString:@";"];
    return array;
}
/** 提供每个题目对应的控制器的类型。题目和类型数量必须一致 */
+ (NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[VideosByUserViewController class]];
    }
    return [arr copy];
}

-(UIColor *)titleColorNormal{
    return [UIColor colorWithRed:146/255 green:177/255 blue:0 alpha:1];/////
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"订阅";
    [Factory addMenuItemToVC:self];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:user_data]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"您现在没有订阅的用户" message:@"请输入想要订阅的用户昵称，用“；”键添加更多" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"添加", nil];
        alert.alertViewStyle = FUIAlertViewStylePlainTextInput;
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    UITextField *textf0 = [alertView textFieldAtIndex:0];
    [self isTrueTextInput:textf0.text CompleteHandle:nil];
    
    if ([textf0.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"没有输入内容" maskType:3];
    }
    
    /** 判断添加的账户是否有内容 */
    if (self.array.count) {
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:user_data];
        NSString *userFollowtext = nil;
        if (dict[@"userFollowing"] == nil) {
            userFollowtext = [NSString stringWithFormat:@"%@",textf0];
        }else{
            userFollowtext = [textf0.text stringByAppendingFormat:@";%@",dict[@"userFollowing"]];
        }
        NSLog(@".................%ld",self.array.count);
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithDictionary:@{@"userFollowing":userFollowtext}];
        [userInfo writeToFile:user_data atomically:YES];
    }else{
        [SVProgressHUD showInfoWithStatus:@"该用户没有发布视频或没有该用户" maskType:3];
    }
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


/** 判断输入的是否是正确的名称 */
- (void)isTrueTextInput:(NSString *)text CompleteHandle:(CompletionHandle)completionHandle{
    [VideosByUserNetModel getVideosByUserWithUser:text andPage:1 completionHandle:^(VideosByUserModel* model, NSError *error) {

        [self.array addObjectsFromArray:model.videos];
//        completionHandle(error);
    }];
    NSLog(@"%@",_array);
}

- (NSMutableArray *)array {
	if(_array == nil) {
		_array = [[NSMutableArray alloc] init];
	}
	return _array;
}

@end
