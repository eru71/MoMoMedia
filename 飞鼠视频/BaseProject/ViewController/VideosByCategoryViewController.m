//
//  VideosByCategoryViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosByCategoryViewController.h"
#import "VategoryViewModel.h"
#import "VideoByCategoryCollectionViewCell.h"
#import "VideosViewController.h"

@interface VideosByCategoryViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) VategoryViewModel *vVM;

@end

@implementation VideosByCategoryViewController

- (VategoryViewModel *)vVM {
    if(_vVM == nil) {
        _vVM = [[VategoryViewModel alloc] init];
    }
    return _vVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView reloadData];

    [self.collectionView.mj_header beginRefreshing];
    [Factory addMenuItemToVC:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.vVM.rowNumber;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    VideoByCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [cell.iconImageView.imageView setBackgroundColor:[UIColor colorWithRed:0.136 green:1.000 blue:0.189 alpha:1.000]];
    cell.layer.cornerRadius = 7;
    cell.iconImageView.layer.cornerRadius = 7;
    cell.titleLb.text = [self.vVM nameForRow:indexPath.row];
    
    return cell;
}
#pragma mark - UICollectionViewDataDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    VideosViewController *vc = [[VideosViewController alloc]initWithType:[self.vVM nameForRow:indexPath.row]];
    
    [self.navigationController pushViewController:vc animated:YES];
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
    CGFloat width = kWindowW / 4;
    CGFloat height = width + 20;
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
            [self.vVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_collectionView reloadData];
                }
                [_collectionView.mj_header endRefreshing];
            }];
        }];
        [_collectionView registerClass:[VideoByCategoryCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return _collectionView;
}



@end
