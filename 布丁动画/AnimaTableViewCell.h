//
//  AnimaTableViewCell.h
//  布丁动画
//
//  Created by cq on 15/10/1.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimaTableViewCell : UITableViewCell

@property (nonatomic,strong,readonly) UIImageView *animeImageView;
@property (nonatomic,strong,readonly) UILabel *nameLabel;
@property (nonatomic,strong,readonly) UILabel *categoryNamesLabel;
@property (nonatomic,strong,readonly) UILabel *updatedLabel;

@end
