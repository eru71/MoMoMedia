//
//  SearchResultViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchResultViewController.h"
#import "SearchByKeywordViewModel.h"
#import "VideosByUserCollectionViewCell.h"
#import "ShowsViewController.h"

@interface SearchResultViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) SearchByKeywordViewModel *searchVM;

@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation SearchResultViewController

-(id)initWithKeyword:(NSString *)keyword{
    if (self = [super init]) {
        _keyword = keyword;
    }
    return self;
}

- (SearchByKeywordViewModel *)searchVM{
    if (_searchVM == nil) {
        _searchVM = [[SearchByKeywordViewModel alloc]initWithKeyword:_keyword];
    }
    return _searchVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.title = @"Anime";
    [self.collectionView reloadData];
    [self.collectionView.mj_header beginRefreshing];
    [Factory addBackItemToVC:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.searchVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    VideosByUserCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.title.text = [_searchVM titleForRow:indexPath.row];
    [cell.iconView.imageView setImageWithURL:[self.searchVM thumbnailV2:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.viewCountLb.text = [_searchVM viewCountForRow:indexPath.row];
    cell.publishedLb.text = [_searchVM publishedForRow:indexPath.row];
    //边框设定
    cell.iconView.layer.cornerRadius = 7;
//    cell.layer.borderWidth = 0.6;
//    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    return cell;
}
#pragma mark - UICollectionViewDataDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self showProgress];
    ShowsViewController *svc = [[ShowsViewController alloc]initWithRequest:[NSURLRequest requestWithURL:[self.searchVM linkForRow:indexPath.row]] webTitle:[self.searchVM titleForRow:indexPath.row]];
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
    //    CGFloat width = kWindowW - 2 * 10;
    //    CGFloat height = width/2 + 30;
    CGFloat width = (kWindowW - 3 * 20) / 2;
    CGFloat height = width / 2 + 3 * 20;
    
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
            [self.searchVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_collectionView reloadData];
                }
                [_collectionView.mj_header endRefreshing];
            }];
        }];
        _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.searchVM getMoreDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                    
                }else{
                    [_collectionView reloadData];
                }
                [_collectionView.mj_footer endRefreshing];
            }];
        }];
        [_collectionView registerClass:[VideosByUserCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return _collectionView;
}


@end
