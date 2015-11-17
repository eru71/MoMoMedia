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

@interface FollowingWMPageController ()

@property (nonatomic,strong) UserFollowingViewModel *ufVM;

@end

@implementation FollowingWMPageController

- (UserFollowingViewModel *)ufVM {
    if(_ufVM == nil) {
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:user_data];
        _ufVM = [[UserFollowingViewModel alloc] initWithUserName:dic[@"name"]];
    }
    return _ufVM;
}

+ (UINavigationController *)standardFollowNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        FollowingWMPageController *vc = [[FollowingWMPageController alloc] initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        //例如设置第一个控制器的某个属性的值, KVC
        //vc setValue:[values[0]] forKey:keys[0]
        vc.keys = [self vcKeys];
        vc.values = [self vcKeys];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}

///** 提供每个VC对应的values值数组 */
//+ (NSArray *)vcValues{
//    NSArray *arr = [self itemNames];
//    return arr;
//}
/** 提供每个VC对应的key值数组 */
+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

/** 提供题目数组 */
+ (NSArray *)itemNames{
    NSMutableArray *arr = [NSMutableArray new];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:user_data];
    UserFollowingViewModel *ufVM = [[UserFollowingViewModel alloc] initWithUserName:dic[@"name"]];
    for (int i = 0; i < ufVM.rowNumber; i++) {
        [arr addObject:[ufVM nameForRow:i]];
    }
    return arr;
}
/** 提供每个题目对应的控制器的类型。题目和类型数量必须一致 */
+ (NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[VideosByUserViewController class]];
    }
    return [arr copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"订阅";
    [Factory addMenuItemToVC:self];
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
