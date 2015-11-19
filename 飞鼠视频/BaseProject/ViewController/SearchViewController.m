//
//  SearchViewController.m
//  BaseProject
//
//  Created by Colette71 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchViewController.h"
#import "VideosByUserViewController.h"
@interface SearchViewController ()<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

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
    [Factory addMenuItemToVC:self];
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;
{
    if (searchText!=nil && searchText.length>0) {
//        NSLog(@"searchText:%@",searchText);
    }
    else
    {
//        [self showErrorMsg:@"没有输入内容"];
    }
    
}

-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (searchBar.text==nil) {
        [self showErrorMsg:@"没有输入内容"];
    }else{
        VideosByUserViewController *vc = [[VideosByUserViewController alloc]initWithKeyword:searchBar.text];
        [self.navigationController presentViewController:vc animated:YES completion:nil];
        NSLog(@"%@",searchBar.text);
    }
    [_searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    VideosByUserViewController *vc = [[VideosByUserViewController alloc]initWithKeyword:searchBar.text];
    [_searchBar resignFirstResponder];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
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
