//
//  ParseTool.h
//  QPorn
//
//  Created by qgy on 2018/3/22.
//  Copyright © 2018年 qgy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class VideoResult;
@class ForumContent;

@interface ParseTool : NSObject

+ (NSMutableArray *)parseIndex:(NSString *)html;
+ (VideoResult *)parseVideo:(NSString *)html;
+ (NSMutableArray *)parseRecentUpate:(NSString *)html;
+ (NSMutableArray *)parseMeiZiTu:(NSString *)html;
+ (NSMutableArray *)parseMeiZiTuContent:(NSString *)html;
+ (NSMutableArray *)parseForum:(NSString *)html;
+ (ForumContent *)parseForumContent:(NSString *)html;
+ (NSMutableArray *)parseForumOther:(NSString *)html;
//MaoMi
+ (NSMutableArray *)parseMaoMiList:(NSString *)html;

@end
