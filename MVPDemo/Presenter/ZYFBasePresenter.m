//
//  ZYFBasePresenter.m
//  MVPDemo
//
//  Created by linjianguo on 2018/5/19.
//  Copyright © 2018年 com.justsee. All rights reserved.
//

#import "ZYFBasePresenter.h"

@implementation ZYFBasePresenter
- (instancetype)initWithView:(id)view
{
    if (self = [super init]) {
        _view = view;
    }
    return self;
}


- (void)attractView:(id)view
{
    _view = view;
}

- (void)detachView:(id)view
{
    _view = nil;
}
@end
