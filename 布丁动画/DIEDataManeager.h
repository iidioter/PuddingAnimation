//
//  DIEDataManeager.h
//  布丁动画
//
//  Created by cq on 15/9/30.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DIENewWorkManeager.h"
#import "DIEAnimeModel.h"
#import "DIECategoryModel.h"

@interface DIEDataManeager : NSObject 

@property (nonatomic,strong,readonly) NSMutableArray <DIECategoryModel *> *categoriesArray;
@property (nonatomic,strong,readonly) NSMutableArray <DIEAnimeModel *> *animeArray;

+ (instancetype)sharedManager;

- (void)updateCategory;

- (void)loadMoreCategory;

- (void)updateAnimeWithCategoryTd:(NSString *)categoryId;


@end
