//
//  MaoMiVideoController.m
//  QPorn
//
//  Created by qgy on 2019/3/24.
//  Copyright © 2019年 test. All rights reserved.
//

#import "MaoMiVideoController.h"
#import "ApiService.h"
#import "MaoMiVideoItem.h"

@interface MaoMiVideoController ()

@end

@implementation MaoMiVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

#pragma mark - data
- (void)loadData
{
    return;
    [[ApiService shareInstance] requestMaoMiWithId:self.item.Id success:^(NSMutableArray<MaoMiVideoItem *> *datas) {
        
    } fail:^(NSString *msg) {
        
    }];
}

@end
