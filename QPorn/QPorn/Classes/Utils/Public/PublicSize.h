//  视图尺寸
//  PublicSize.h
//  QPorn
//
//  Created by qgy on 15/7/3.
//  Copyright (c) 2015年 vYoutech. All rights reserved.
//

#ifndef QPorn_PublicSize_h
#define QPorn_PublicSize_h

#define WHMIN(a,b)              ((a) > (b) ? (b) : (a))
#define WHMAX(a,b)              ((a) > (b) ? (a) : (b))
#define SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height
#define PortraitWidth           WHMIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define PortraitHeight          (WHMAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) - HeightGap)
#define HeightGap               (([Utils currentScreenScale] == 1) ? 58 : 0)
#define SafeAreaTopHeight       (([Utils currentScreenScale] == 1) ? 88 : 64)
#define SafeAreaBottomHeight    (([Utils currentScreenScale] == 1) ? 34 : 0)

#define iSScreen3_5_Inch        (PortraitHeight <= 480.0) //4/4S屏幕尺寸
#define iSScreen3_Inch          (PortraitWidth <= 320.0)  //4/4S/5屏幕尺寸

#define ViewSizeEnlargementMultiplier       ((PortraitWidth) < (414.0) ? (1.0) : (1.5))
#define LessViewSizeEnlargementMultiplier   ((PortraitWidth) < (414.0) ? (1.0) : (1.2))
#define SmallerViewSizeMultiplier           ((PortraitWidth) < (375.0) ? (0.8) : (1.0))  //5s,5c等手机缩小比例

#define kStatusBarOrientation [UIApplication sharedApplication].statusBarOrientation
#define kLandscapeOrientation (kStatusBarOrientation == UIInterfaceOrientationLandscapeLeft || kStatusBarOrientation == UIInterfaceOrientationLandscapeRight)

#define kStatusBarHeight 20.f
#define kNavigationBarHeight 44.f
#define kStatusAndNavigationBarHeight (kStatusBarHeight+kNavigationBarHeight)
#define kTabBarHeight 49.f
#define kiPhoneX                [UIView iPhoneX]
#define kSafeAreaTopHeight      ([Utils currentScreenScale] ? 24.f : 0.f)//顶部
#define kSafeAreaBottomHeight   (kiPhoneX ? (kLandscapeOrientation ? 21.f : 34.f) : 0.f)//底部
#define kRemoveBarViewHeight   (PortraitHeight + HeightGap - kNavigationBarHeight - kStatusBarHeight - kSafeAreaTopHeight)//去掉导航栏和时间栏的高度

#pragma mark - DelayTime

#define kOsdWaitTime 2

#endif
