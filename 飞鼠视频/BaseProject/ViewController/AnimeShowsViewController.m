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
    // Do any additional setup after loading the view.
//    self.title = @"Anime";
    [self.collectionView reloadData];
    [self.collectionView.mj_header beginRefreshing];
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
    
    cell.nameLb.text = [_vsVM nameForRow:indexPath.row];
    [cell.iconView.imageView setImageWithURL:[self.vsVM iconForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.lastupdateLb.text = [self.vsVM lastupdateForRow:indexPath.row];
    cell.episodeUpdatedLb.text = [self.vsVM episodeUpdatedForRow:indexPath.row];
    [cell.playingBtn bk_addEventHandler:^(id sender) {
        
        ShowsViewController *lastVideoVC = [[ShowsViewController alloc]initWithRequest:[NSURLRequest requestWithURL:[self.vsVM lastPlayLinkForRow:indexPath.row]] webTitle:cell.nameLb.text];
        [self.navigationController pushViewController:lastVideoVC animated:YES];
//        [self presentViewController:lastVideoVC animated:YES completion:nil];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
#pragma mark - UICollectionViewDataDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShowsViewController *svc = [[ShowsViewController alloc]initWithRequest:[NSURLRequest requestWithURL:[self.vsVM linkForRow:indexPath.row]] webTitle:[self.vsVM nameForRow:indexPath.row]];
    [self.navigationController pushViewController:svc animated:YES];
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
    CGFloat width = (kWindowW - 5 * 20) / 4;
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
