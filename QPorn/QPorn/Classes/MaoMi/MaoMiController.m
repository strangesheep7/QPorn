//
//  MaoMiController.m
//  QPorn
//
//  Created by qgy on 2019/3/24.
//  Copyright © 2019年 test. All rights reserved.
//

#define TitleArray @[@"短视频", @"国产精品", @"女优专辑", @"中文字幕", @"亚洲无码", @"欧美精品", @"成人动漫"]

#import "MaoMiController.h"
#import "CTScrollBarView.h"
#import "MaoMiPageController.h"

@interface MaoMiController () <CTScrollBarViewDelegate>

@property (nonatomic, weak) CTScrollBarView *barView;

@end

@implementation MaoMiController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.navigationItem.title = @"猫咪";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupChildViewControllers];
    [self setupScrollBarView];
}

- (void)setupScrollBarView {
    CTScrollBarView *barView = [CTScrollBarView barViewWithFrame:CGRectZero andTitleArray:TitleArray andDelegate:self];
    barView.lazyLoad = YES;
    [self.view addSubview:barView];
    self.barView = barView;
    CGFloat navH = self.navigationController.navigationBar.bounds.size.height;
    CGFloat statusH = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat tabBarH = ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).tabBar.frame.size.height;
    barView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - navH - statusH - tabBarH);
}

#pragma mark - childView
- (void)setupChildViewControllers {
    for (int i = 0; i < TitleArray.count; i++) {
        MaoMiPageController *vc = [[MaoMiPageController alloc] init];
        vc.type = [NSString stringWithFormat:@"list-%@",TitleArray[i]];
        [self addChildViewController:vc];
    }
}

#pragma mark - CTScrollBarViewDelegate
- (UIView *)scrollBarView:(CTScrollBarView *)barView viewAtIndex:(NSInteger)index {
    UIViewController *vc = self.childViewControllers[index];
    return vc.view;
}


@end
