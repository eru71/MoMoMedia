//
//  AnimeShowsViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AnimeShowsViewController.h"
#import "ShowsCollectionViewCell.h"
#import "VideoShowsViewModel.h"
#import "ShowsViewController.h"
#import <AVKit/AVKit.h>
#import "VideoShowViewController.h"


@interface AnimeShowsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) VideoShowsViewModel *vsVM;


@end

@implementation AnimeShowsViewController

-(id)initWithType:(NSString *)type{
    if (self = [super init]) {
        _type = type;
        self.title = type;
    }
    return self;
}

- (VideoShowsViewModel *)vsVM {
    if(_vsVM == nil) {
        _vsVM = [[VideoShowsViewModel alloc]initWithType:_type];
    }
    return _vsVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView reloadData];

    [self.collectionView.mj_header beginRefreshing];
    [Factory addMenuItemToVC:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.vsVM.rowNumber;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ShowsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.layer.cornerRadius = 5;
    self.collectionView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:233/255.0 alpha:1];
    cell.nameLb.text = [_vsVM nameForRow:indexPath.row];
    [cell.iconView.imageView setImageWithURL:[self.vsVM iconForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.iconView.layer.cornerRadius = 7;
    cell.layer.borderWidth = 0.8;
    cell.layer.borderColor = [UIColor colorWithRed:0.893 green:0.730 blue:0.488 alpha:1.000].CGColor;
    cell.layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    cell.lastupdateLb.text = [self.vsVM lastupdateForRow:indexPath.row];
    cell.episodeUpdatedLb.text = [self.vsVM episodeUpdatedForRow:indexPath.row];
//    [cell.playingBtn bk_addEventHandler:^(id sender) {
//        
////        ShowsViewController *lastVideoVC = [[ShowsViewController alloc]initWithRequest:[NSURLRequest requestWithURL:[self.vsVM lastPlayLinkForRow:indexPath.row]] webTitle:cell.nameLb.text];
//
////        [self.navigationController pushViewController:lastVideoVC animated:YES];
//        [self showProgress];
////        VideoShowViewModel *videoVM = [[VideoShowViewModel alloc]initWithVideoID:[self.vsVM videoIDForRow:indexPath.row]];
////        [videoVM getDataFromNetCompleteHandle:^(NSError *error) {
////            DDLogVerbose(@"%@",videoVM.vsM.player);
////        }];
////        ShowsViewController *vc = [[ShowsViewController alloc]initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:videoVM.vsM.player]] webTitle:cell.nameLb.text];
//        
//        VideoShowViewController *vc = [[VideoShowViewController alloc]initWithVideoID:[self.vsVM videoIDForRow:indexPath.row]];
//        
//        [self.navigationController pushViewController:vc animated:YES];
//        
//    } forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
#pragma mark - UICollectionViewDataDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShowsViewController *lastVideoVC = [[ShowsViewController alloc]initWithRequest:[NSURLRequest requestWithURL:[self.vsVM lastPlayLinkForRow:indexPath.row]] webTitle:[self.vsVM nameForRow:indexPath.row]];
    
    [self.navigationController pushViewController:lastVideoVC animated:YES];
}

#pragma mark - UICollectionViewDelegateFlowLayout
/** section的上下左右边距 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}
/** 最小行间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}
/** 最小列间距、因为已经算出每个cell的宽度。 cell的列间距不用指定也会自动适配的*/
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 20;
//}
/** 每格cell的 宽高 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kWindowW - 4 * 20) / 3;
    CGFloat height = width * 2;
    return CGSizeMake(width, height);
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */



- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];

        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.vsVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_collectionView reloadData];
                }
                [_collectionView.mj_header endRefreshing];
            }];
        }];
        
        _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.vsVM getMoreDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                    
                }else{
                    [_collectionView reloadData];
                }
                [_collectionView.mj_footer endRefreshing];
            }];
        }];
        
        [_collectionView registerClass:[ShowsCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return _collectionView;
}




@end
