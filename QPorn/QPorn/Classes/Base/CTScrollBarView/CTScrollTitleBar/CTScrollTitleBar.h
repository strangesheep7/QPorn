//
//  CTScrollTitleBar.h
//  testForTitleBarScroll
//
//  Created by qgy on 2017/12/26.
//  Copyright © 2017年 qgy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CTScrollTitleBar;

@protocol CTScrollTitleBarDelegate <NSObject>
- (void)scrollTitleBar:(CTScrollTitleBar *)bar didClickIndex:(NSInteger)index;
@end

@interface CTScrollTitleBar : UIView
- (instancetype)initWithFrame:(CGRect)frame andTitleArray:(NSArray *)titleArray;
- (void)scrollToIndex:(NSInteger)index;
@property (nonatomic, weak) id<CTScrollTitleBarDelegate> delegate;
@end
