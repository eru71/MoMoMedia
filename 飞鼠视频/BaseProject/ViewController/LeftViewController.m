//
//  LeftViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"

#import "VideoShowsViewController.h"
#import "FollowingWMPageController.h"
#import "VideosByUserViewController.h"

@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *itemNames;
@property (nonatomic,strong) UIView *viewFortable;
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UILabel *nameLb;
@property (nonatomic,strong) TRImageView *iconView;

@end
@implementation LeftViewController

- (NSArray *)itemNames{
    return @[@"节目",@"订阅"];
}

- (UIView *)headerView {
    if(_headerView == nil) {
        _headerView = [[UIView alloc] init];
        [self.view addSubview:_headerView];
        _headerView.backgroundColor = [UIColor greenSeaColor];
        [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kWindowW*1/4-20);
//            make.centerY.mas_equalTo(0);
            make.bottom.mas_equalTo(self.viewFortable.mas_top).mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW*1/4+20, kWindowH/7));
        }];
    }
    return _headerView;
}

- (UIView *)viewFortable {
    if(_viewFortable == nil) {
        _viewFortable = [[UIView alloc] init];
        [self.view addSubview:_viewFortable];
        
        [_viewFortable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW*3/4-20, kWindowH/2));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];
        _viewFortable.backgroundColor = [UIColor lightGrayColor];
    }
    return _viewFortable;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        [self.headerView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
    }
    return _nameLb;
}

- (TRImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [[TRImageView alloc] init];
        
    }
    return _iconView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView=[UIView new];
        [self.viewFortable addSubview:_tableView];
//        [self.view addSubview:_tableView];
        _tableView.backgroundColor=[UIColor clearColor];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(kWindowW*3/4-20, kWindowH/2));
//            make.centerY.mas_equalTo(0);
//            make.left.mas_equalTo(0);
            make.top.bottom.left.right.mas_equalTo(0);
        }];
        //去掉分割线
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemNames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.accessoryType = 1;
    cell.textLabel.text = self.itemNames[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}
kRemoveCellSeparator
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[VideoShowsViewController standardNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 1:
            [self.sideMenuViewController setContentViewController:[FollowingWMPageController standardFollowNavi]animated:YES];
//            [self.sideMenuViewController setContentViewController:[VideosByUserViewController standardNavi]];
            [self.sideMenuViewController hideMenuViewController];
            break;
        default:
            break;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.headerView.backgroundColor = [UIColor blueColor];
    [self.tableView reloadData];
}








@end
