//
//  CollectionPresenter.m
//  MVPDemo
//
//  Created by linjianguo on 2018/5/19.
//  Copyright © 2018年 com.justsee. All rights reserved.
//

#import "CollectionPresenter.h"
#import "FFProtocol.h"
#import "authorModel.h"
@implementation CollectionPresenter


- (void)requestImgs
{
    [_view  showLoadingHUD];
    [NetWorkManager requestForGetWithUrl:[NSString stringWithFormat:@"%@?type=%@",bannerURL,@"home"] parameter:@{} success:^(id reponseObject) {
        if ([reponseObject[@"code"] integerValue] == 1) {
            for (NSDictionary *dic in reponseObject[@"result"]) {
                NSString *imgstr = dic[@"img_url"];
                
                NSString *str = ImageViewURL(imgstr);
                
                [self.ImgsArray addObject:str];
            }
        }
        [self->_view hideLoadingHUD];
        
        [self->_view reloadDataSource];
        
        
    } failure:^(NSError *error) {
         [self->_view showError];
    }];
}


//请求
- (void)request
{
    
    [_view  showLoadingHUD];
    [NetWorkManager requestForGetWithUrl:[NSString stringWithFormat:@"%@?token=%@&page_no=%ld",accountfriendURL,[UserInfoManager getUserInfo].token,self.currentPage] parameter:@{} success:^(id reponseObject) {
        
        if ([reponseObject[@"code"] integerValue] == 1) {
            for (NSDictionary *dic in reponseObject[@"result"][@"list"]) {
                authorModel *model = [authorModel new];
                [model setValuesForKeysWithDictionary:dic];
                [self.dataArray addObject:model];
            }
        }
        
        [self->_view hideLoadingHUD];
        [self->_view reloadDataSource];
        [self  refrestForpages:[reponseObject[@"result"][@"totalPage"] integerValue]];
    } failure:^(NSError *error) {
      
        [self->_view showError];
    }];
}

- (void)refrestForpages:(NSInteger)page
{
    [_view refreshSrollViewToTop:page];
}

- (NSMutableArray<authorModel *> *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}
- (NSMutableArray *)ImgsArray
{
    if (!_ImgsArray) {
        _ImgsArray = [NSMutableArray new];
    }
    return _ImgsArray;
}

@end
