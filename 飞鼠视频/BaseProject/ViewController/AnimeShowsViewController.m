//
//  AnimeShowsViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AnimeShowsViewController.h"

@interface AnimeShowsViewCell : UICollectionViewCell

@property (nonatomic,strong) TRImageView *iconView;
@property (nonatomic,strong) UILabel *nameLb;
@property (nonatomic,strong) UIButton *playingBtn;
@property (nonatomic,strong) UILabel *episodeUpdatedLb;
@property (nonatomic,strong) UILabel *lastupdateLb;
@property (nonatomic,strong) UIView *upView;

@end

@implementation AnimeShowsViewCell


- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = [UIFont systemFontOfSize:12];
        _nameLb.textAlignment = NSTextAlignmentLeft;
        _nameLb.numberOfLines = 2;
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(self.episodeUpdatedLb.mas_top).mas_equalTo(0);
            make.top.mas_equalTo(self.iconView.mas_bottom).mas_equalTo(0);
            make.height.mas_lessThanOrEqualTo(30);
            make.height.mas_greaterThanOrEqualTo(20);
        }];
    }
    return _nameLb;
}

- (TRImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.bottom.mas_equalTo(_nameLb.mas_top).mas_equalTo(0);
        }];
    }
    return _iconView;
}


- (UIButton *)playingBtn {
    if(_playingBtn == nil) {
        _playingBtn = [[UIButton alloc] init];
        [_playingBtn setBackgroundImage:[UIImage imageNamed:@"btn_prelisten_play"] forState:UIControlStateNormal];
        [self.iconView addSubview:_playingBtn];
//        _playingBtn.tag = 100;
        [_playingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(25);
        }];
    }
    return _playingBtn;
}

- (UILabel *)episodeUpdatedLb {
    if(_episodeUpdatedLb == nil) {
        _episodeUpdatedLb = [[UILabel alloc] init];
        [self.contentView addSubview:_episodeUpdatedLb];
        _episodeUpdatedLb.font = [UIFont systemFontOfSize:12];
        [_episodeUpdatedLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_nameLb.mas_bottom).mas_equalTo(0);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(15);
            make.bottom.mas_equalTo(0);
        }];
    }
    return _episodeUpdatedLb;
}

-(UIView *)upView{
    if (!_upView) {
        _upView = [UIView new];
        [self.iconView addSubview:_upView];
        _upView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [_upView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(15);
        }];
    }
    return _upView;
}

- (UILabel *)lastupdateLb {
    if(_lastupdateLb == nil) {
        _lastupdateLb = [[UILabel alloc] init];
        [self.upView addSubview:_lastupdateLb];
        _lastupdateLb.font = [UIFont systemFontOfSize:10];
        _lastupdateLb.textColor = [UIColor whiteColor];
        [_lastupdateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.mas_equalTo(0);
//            make.height.mas_equalTo(20);
        }];
    }
    return _lastupdateLb;
}

@end

#import "VideoShowsViewModel.h"
@interface AnimeShowsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) VideoShowsViewModel *vsVM;

@end

@implementation AnimeShowsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Anime";
    [self.collectionView reloadData];
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
    AnimeShowsViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.nameLb.text = [_vsVM nameForRow:indexPath.row];
    [cell.iconView.imageView setImageWithURL:[self.vsVM iconForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.lastupdateLb.text = [self.vsVM lastupdateForRow:indexPath.row];
    cell.episodeUpdatedLb.text = [self.vsVM episodeUpdatedForRow:indexPath.row];
    [cell.playingBtn bk_addEventHandler:^(id sender) {
        NSLog(@"....");
    } forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
#pragma mark - UICollectionViewDataDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
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

- (VideoShowsViewModel *)vsVM {
    if(_vsVM == nil) {
        _vsVM = [[VideoShowsViewModel alloc]init];
    }
    return _vsVM;
}

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
        
        [_collectionView registerClass:[AnimeShowsViewCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return _collectionView;
}


@end
