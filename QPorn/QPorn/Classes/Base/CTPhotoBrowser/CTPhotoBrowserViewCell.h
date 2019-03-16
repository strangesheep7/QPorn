//
//  CTPhotoBrowserViewCell.h
//  CTPhotoBrowser
//
//  Created by qgy on 2017/2/22.
//  Copyright © 2017年 qgy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTPhotoBrowserViewCell : UICollectionViewCell

@property (nonatomic, strong) NSString *imageURL;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, weak) UIImageView *imageView;

@end
