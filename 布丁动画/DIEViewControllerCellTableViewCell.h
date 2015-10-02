//
//  DIEViewControllerCellTableViewCell.h
//  布丁动画
//
//  Created by cq on 15/9/30.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface DIEViewControllerCellTableViewCell : UITableViewCell

@property (nonatomic) UIImageView *avatorImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *subTiteLabel;
@property (nonatomic,strong) UILabel *statusLabel;

@end
