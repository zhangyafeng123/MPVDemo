//
//  HomeCell.m
//  rainbowmkyl
//
//  Created by linjianguo on 2018/5/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "HomeCell.h"
#import "authorModel.h"
#import "CollectionPresenter.h"
@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)configureData:(CollectionPresenter *)presenter  indexPath:(NSIndexPath *)indexPath
{
    
    
    
    authorModel *model = presenter.dataArray[indexPath.row];
    
    
    [self.img sd_setImageWithURL:[NSURL URLWithString:model.user_head] placeholderImage:[UIImage imageNamed:@"my-1"]];
    self.nickname.text = [NSString stringWithFormat:@"%@",model.nick_name];
    self.fensi.text =[NSString stringWithFormat:@"粉丝(%ld)作品(%ld)",model.fans,model.works];
}

@end
