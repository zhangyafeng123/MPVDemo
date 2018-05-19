//
//  FirstViewController.m
//  MVPDemo
//
//  Created by linjianguo on 2018/5/19.
//  Copyright © 2018年 com.justsee. All rights reserved.
//

#import "FirstViewController.h"
#import "CollectionPresenter.h"
#import "FFProtocol.h"
#import "HomeCell.h"
#import "HeaderView.h"
#define kScrollViewHeight   kFit(200)
#define kItemSizeHeight  kFit(250)
@interface FirstViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,FFProtocol>
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)CollectionPresenter *presenter;
@end

@implementation FirstViewController
//懒加载
- (CollectionPresenter *)presenter
{
    if (!_presenter) {
        _presenter = [[CollectionPresenter alloc] init];
        [_presenter attractView:self];
        _presenter.currentPage = 1;
    }
    return _presenter;
}

-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        flow.headerReferenceSize = CGSizeMake(kScreenWidth, kScrollViewHeight);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, kScreenWidth, kScreenHeight - kNavBarHeight) collectionViewLayout:flow];
        _collectionView.backgroundColor = [UIColor whiteColor];
        flow.itemSize = CGSizeMake(kScreenWidth/2-kFit(5), kItemSizeHeight);
        
        flow.minimumLineSpacing = kFit(2);
        flow.minimumInteritemSpacing = kFit(2);
        flow.sectionInset = UIEdgeInsetsMake(kFit(2), kFit(2), kFit(2), kFit(2));
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        //注册
        [_collectionView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellWithReuseIdentifier:@"HomeCell"];
        [_collectionView registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    //请求数据
    [self.presenter requestImgs];
    //页面请求
    [self.presenter request];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.presenter.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCell" forIndexPath:indexPath];
    [cell configureData:self.presenter indexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeaderView *v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    [v configureData:self.presenter];
    return v;
}
#pragma mark -------FFProtocol--------------
- (void)reloadDataSource
{
    [self.collectionView reloadData];
}
- (void)showLoadingHUD
{
    [SVProgressHUD showWithStatus:@"请求中"];
}
- (void)hideLoadingHUD
{
    [SVProgressHUD dismiss];
}
- (void)showSuccess
{
    [SVProgressHUD showSuccessWithStatus:@"加载成功"];
     [SVProgressHUD dismissWithDelay:3.0];
}
- (void)showError
{
    [SVProgressHUD showErrorWithStatus:@"加载失败"];
    [SVProgressHUD dismissWithDelay:3.0];
}
- (void)refreshSrollViewToTop:(NSInteger)numpage
{
    if (numpage > self.presenter.currentPage) {
         self.presenter.currentPage += 1;
        __weak typeof(self) weakSelf = self;
        self.collectionView.mj_footer = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
            [weakSelf.collectionView.mj_footer beginRefreshing];
            [weakSelf.presenter request];
            [weakSelf.collectionView.mj_footer endRefreshing];
        }];
    } else {
        self.collectionView.mj_footer.state = MJRefreshStateNoMoreData;
    }
}
//点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
