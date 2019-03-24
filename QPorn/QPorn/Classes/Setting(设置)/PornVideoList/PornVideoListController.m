//
//  PornVideoListController.m
//  QPorn
//
//  Created by qgy on 2019/3/24.
//  Copyright © 2019年 test. All rights reserved.
//

#import "PornVideoListController.h"
#import "Masonry.h"
#import "PornVideoCell.h"
#import "MJRefresh.h"
#import "ApiService.h"
#import "PornVideoItem.h"
#import "CTPhotoBrowserController.h"

static NSString * const PornVideoCellID = @"PornVideoCell";

@interface PornVideoListController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation PornVideoListController

- (instancetype)init
{
    if (self = [super init])
    {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.currentPage == 0) //如果没有给个默认值
    {
        self.currentPage = 27000;
    }
    
    self.datas = [NSMutableArray array];
    [self setupUI];
    [self setupRefresh];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat itemW = screenW * 0.5 - 1;
    CGFloat itemH = itemW / 236.0 * 354.0;
    self.layout.itemSize = CGSizeMake(itemW, itemH);
    self.layout.minimumLineSpacing = 1;
    self.layout.minimumInteritemSpacing = 0;
}

#pragma mark - data
- (void)loadData
{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i < 20; i++)
    {
        NSInteger index = self.currentPage + i;
        [tempArray addObject:[NSNumber numberWithInteger:index]];
    }
    
    [self.datas addObjectsFromArray:tempArray];
}

#pragma mark - UI
- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    self.layout = layout;
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view);
    }];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[PornVideoCell class] forCellWithReuseIdentifier:PornVideoCellID];
    collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)setupRefresh {
    __weak typeof(self) weakSelf = self;
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
    [self.collectionView.mj_header setEndRefreshingCompletionBlock:^{
        
    }];
    ((MJRefreshNormalHeader *)self.collectionView.mj_header).lastUpdatedTimeLabel.hidden = YES;
    
    
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
    
    self.collectionView.mj_footer.hidden = YES;
    [self.collectionView.mj_footer setEndRefreshingCompletionBlock:^{
        
    }];
    
    [self.collectionView.mj_header beginRefreshing];
}

#pragma mark - collectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PornVideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PornVideoCellID forIndexPath:indexPath];
    cell.item = self.datas[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    PornVideoItem *item = self.datas[indexPath.item];
    
}

@end
