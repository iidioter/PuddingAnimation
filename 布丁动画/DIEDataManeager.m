//
//  DIEDataManeager.m
//  布丁动画
//
//  Created by cq on 15/9/30.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIEDataManeager.h"
#import "DIENotificationConfig.h"
#import "DIECategoryModel.h"


@interface DIEDataManeager ()
{
    NSInteger _categoryOffset;
    NSInteger _categforyLimit;
}
@end

@implementation DIEDataManeager

static DIEDataManeager *instnce;

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instnce = [DIEDataManeager new];
    });
    return instnce;
    
}

//数据初始化
- (instancetype)init
{
    if (self = [super init]) {
        _categoryOffset = 0;
        _categforyLimit = 18;
        _categoriesArray = [NSMutableArray new];
        _animeArray = [NSMutableArray new];
    }
    return self;
}

- (void)updateCategory
{
    [DIENewWorkManeager categoryWithOffset:0 limit:_categforyLimit completion:^(id responseObject, DIEError *error) {
        NSArray *array = [self parseCategoryData:responseObject];
        [_categoriesArray removeAllObjects];
        [_categoriesArray addObjectsFromArray:array];
        _categoryOffset = 0;
        DIEPost(kDIECategoryUpdateNotif, nil);
    }];
}

- (void)loadMoreCategory{
        [DIENewWorkManeager categoryWithOffset:_categoryOffset limit:_categforyLimit completion:^(id responseObject, DIEError *error) {
            NSArray *array = [self parseCategoryData:responseObject];
            [_categoriesArray addObjectsFromArray:array];
            _categoryOffset+=[array count];
            DIEPost(kDIECategoryUpdateNotif, nil);
        }];
}

#pragma mark parse category infomation array
- (NSArray *)parseCategoryData:(id)categoryData
{
    if ([categoryData isKindOfClass:[NSArray class]]) {
        NSArray *array =  [DIECategoryModel modelsWithArray:categoryData];
        return array;
    }else{
        return @[];
    }
}

//调用网络
- (void)updateAnimeWithCategoryTd:(NSString *)cagoryTd
{
    [DIENewWorkManeager animeWithCategoryId:cagoryTd withLimit:20 completion:^(id responseObject, DIEError *error) {
        NSArray *parsedArray = [self parseAnimeData:responseObject];
        
        [_animeArray removeAllObjects];
        [_animeArray addObjectsFromArray:parsedArray];
        
        NSLog(@"anime:%@", responseObject);
        DIEPost(kDIEAnimeUpdateNotif, nil);
    }];
}

- (NSArray *)parseAnimeData:(id)animeData
{
    if ([animeData isKindOfClass:[NSArray class]]) {
        NSArray *array =  [DIEAnimeModel modelsFromJSONArray:animeData];
        return array;
    }else{
        return @[];
    }
}

@end
