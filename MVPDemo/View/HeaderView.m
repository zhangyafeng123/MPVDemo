//
//  HeaderView.m
//  MVPDemo
//
//  Created by linjianguo on 2018/5/19.
//  Copyright © 2018年 com.justsee. All rights reserved.
//

#import "HeaderView.h"
#import "CollectionPresenter.h"
@interface HeaderView()
@property (nonatomic, strong)SDCycleScrollView *sdcCycleScrollView;

@end

@implementation HeaderView
- (void)configureData:(CollectionPresenter *)presenter
{
    self.sdcCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kFit(200)) imageURLStringsGroup:presenter.ImgsArray];
    self.sdcCycleScrollView.showPageControl = YES;
    [self addSubview:self.sdcCycleScrollView];
}
@end
