//
//  PornVideoCell.m
//  QPorn
//
//  Created by qgy on 2019/3/24.
//  Copyright © 2019年 test. All rights reserved.
//

#import "PornVideoCell.h"
#import "PornVideoItem.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface PornVideoCell ()

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation PornVideoCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.contentView);
    }];
}

- (void)setItem:(PornVideoItem *)item
{
    _item = item;
//    [[SDWebImageManager sharedManager].imageDownloader setValue:@"https://mmbfxl1.com" forHTTPHeaderField:@"Referer"];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.imgUrl] placeholderImage:nil options:SDWebImageCacheMemoryOnly];
}

@end
