//
//  ZYFBasePresenter.h
//  MVPDemo
//
//  Created by linjianguo on 2018/5/19.
//  Copyright © 2018年 com.justsee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYFBasePresenter<E> : NSObject
{
    //MVP 中负责更新的视图
    __weak E _view;
    
}


- (instancetype)initWithView:(E)view;

- (void)attractView:(E)view;

- (void)detachView:(E)view;
@end
