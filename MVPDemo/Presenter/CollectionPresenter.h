//
//  CollectionPresenter.h
//  MVPDemo
//
//  Created by linjianguo on 2018/5/19.
//  Copyright © 2018年 com.justsee. All rights reserved.
//

#import "ZYFBasePresenter.h"

@class authorModel;
@interface CollectionPresenter : ZYFBasePresenter
//数据
@property (nonatomic, strong)NSMutableArray <authorModel *> *dataArray;
@property (nonatomic, strong)NSMutableArray *ImgsArray;
@property (nonatomic, assign)NSInteger currentPage;
//请求
- (void)request;
- (void)requestImgs;


@end
