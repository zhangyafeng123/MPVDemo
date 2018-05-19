//
//  HeaderView.h
//  MVPDemo
//
//  Created by linjianguo on 2018/5/19.
//  Copyright © 2018年 com.justsee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CollectionPresenter;
@interface HeaderView : UICollectionReusableView

- (void)configureData:(CollectionPresenter *)presenter;


@end
