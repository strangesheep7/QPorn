//
//  VideoResult.h
//  QPorn
//
//  Created by qgy on 2018/3/22.
//  Copyright © 2018年 qgy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoResult : NSObject

@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, strong) NSString *videoId;
@property (nonatomic, strong) NSString *ownerUrl;
@property (nonatomic, strong) NSString *ownerId;
@property (nonatomic, strong) NSString *ownerName;
@property (nonatomic, strong) NSString *addDate;
@property (nonatomic, strong) NSString *otherInfo;
@property (nonatomic, strong) NSString *thumImg;
@property (nonatomic, strong) NSString *videoName;

@end
