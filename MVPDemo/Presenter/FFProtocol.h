//
//  FFProtocol.h
//  MVPDemo
//
//  Created by linjianguo on 2018/5/19.
//  Copyright © 2018年 com.justsee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FFProtocol <NSObject>
@required
//显示加载
- (void)showLoadingHUD;
//隐藏加载
- (void)hideLoadingHUD;
//加载成功
- (void)showSuccess;
//加载失败
- (void)showError;

//刷新
- (void)reloadDataSource;
//上拉刷新
- (void)refreshSrollViewToTop:(NSInteger)numpage;


@end
