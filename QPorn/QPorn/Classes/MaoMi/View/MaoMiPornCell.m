//
//  MaoMiPornCell.m
//  QPorn
//
//  Created by qgy on 2019/3/24.
//  Copyright © 2019年 test. All rights reserved.
//

#import "MaoMiPornCell.h"
#import "MaoMiPornItem.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface MaoMiPornCell ()

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation MaoMiPornCell

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

- (void)setItem:(MaoMiPornItem *)item
{
    _item = item;
    [[SDWebImageManager sharedManager].imageDownloader setValue:@"https://mmbfxl1.com" forHTTPHeaderField:@"Referer"];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.thumbUrl] placeholderImage:nil options:SDWebImageCacheMemoryOnly];
}

@end
