//
//  ApiService.h
//  QPorn
//
//  Created by qgy on 2018/3/22.
//  Copyright © 2018年 qgy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PornItem;
@class VideoResult;
@class MeiZiTuItem;
@class ForumItem;
@class ForumContent;
@class MaoMiPornItem;
@class MaoMiVideoItem;

@interface ApiService : NSObject

+ (instancetype)shareInstance;


- (void)requestIndex:(void (^)(NSMutableArray<PornItem *> *datas))success fail:(void (^)(NSString *msg))fail;
- (void)requestVideo:(NSString *)viewkey success:(void (^)(VideoResult *data))success fail:(void (^)(NSString *msg))fail;
- (void)requestRecentUpdatesPage:(NSInteger)page success:(void (^)(NSMutableArray<PornItem *> *datas))success fail:(void (^)(NSString *msg))fail;
/** category:hot, rp, long, md, tf, mf, rf, top, top1, hd */
- (void)requestCategory:(NSString *)category page:(NSInteger)page success:(void (^)(NSMutableArray<PornItem *> *))success fail:(void (^)(NSString *))fail;

/** type:index, hot, best, xinggan, japan, taiwan, mm */
- (void)requestMeiZiTu:(NSString *)type page:(NSInteger)page success:(void (^)(NSMutableArray<MeiZiTuItem *> *datas))success fail:(void (^)(NSString *msg))fail;
- (void)requestMeiZiTuContent:(NSString *)Id success:(void (^)(NSMutableArray<NSString *> *datas))success fail:(void (^)(NSString *msg))fail;


- (void)requestForum:(void (^)(NSMutableArray<ForumItem *> *datas))success fail:(void (^)(NSString *msg))fail;
- (void)requestForumContent:(NSString *)tid success:(void (^)(ForumContent *data))success fail:(void (^)(NSString *msg))fail;
/** type:17, 19, 4, 21, 33, 34 */
- (void)requestForumOtherType:(NSString *)type page:(NSInteger)page success:(void (^)(NSMutableArray<ForumItem *> *datas))success fail:(void (^)(NSString *msg))fail;

//maomi视频
- (void)requestMaoMiWithType:(NSString *)type page:(NSInteger)page success:(void (^)(NSMutableArray<MaoMiPornItem *> *datas))success fail:(void (^)(NSString *msg))fail;
//maomi单个视频
- (void)requestMaoMiWithId:(NSString *)idStr success:(void (^)(NSMutableArray<MaoMiVideoItem *> *datas))success fail:(void (^)(NSString *msg))fail;

@end
