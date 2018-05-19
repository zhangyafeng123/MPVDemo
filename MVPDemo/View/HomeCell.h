//
//  HomeCell.h
//  rainbowmkyl
//
//  Created by linjianguo on 2018/5/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CollectionPresenter;
@interface HomeCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UILabel *fensi;

- (void)configureData:(CollectionPresenter *)presenter  indexPath:(NSIndexPath *)indexPath;

@end
