//
//  MaoMiPageController.m
//  QPorn
//
//  Created by qgy on 2019/3/24.
//  Copyright © 2019年 test. All rights reserved.
//

#import "MaoMiPageController.h"
#import "Masonry.h"
#import "MaoMiPornCell.h"
#import "MJRefresh.h"
#import "ApiService.h"
#import "MaoMiPornItem.h"
#import "CTPhotoBrowserController.h"
#import "MaoMiVideoController.h"

static NSString * const MaoMiPornCellID = @"MaoMiPornCell";

@interface MaoMiPageController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, assign) NSInteger page;

@end

@implementation MaoMiPageController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
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
    [[ApiService shareInstance] requestMaoMiWithType:self.type page:self.page success:^(NSMutableArray<ForumItem *> *datas) {
        [self.datas addObjectsFromArray:datas];
        self.page++;
        [self.collectionView reloadData];
        [self.collectionView.mj_header endRefreshing];
        self.collectionView.mj_footer.hidden = NO;
    } fail:^(NSString *msg) {
        [self.collectionView.mj_header endRefreshing];
    }];
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
    [collectionView registerClass:[MaoMiPornCell class] forCellWithReuseIdentifier:MaoMiPornCellID];
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
    MaoMiPornCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MaoMiPornCellID forIndexPath:indexPath];
    cell.item = self.datas[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MaoMiPornItem *item = self.datas[indexPath.item];
    
    MaoMiVideoController *vc = [[MaoMiVideoController alloc] init];
    vc.item = item;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

@end
