//
//  DIECategoryModel.h
//  布丁动画
//
//  Created by cq on 15/9/29.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#define kCategoryId @"_id"
#define kCategoryAnimeCount @"animeCont"
#define kCategoryName @"name"

#define kCategoryImage @"image"
#define kCategoryImageWidth @"width"
#define kCategoryImageHeight @"height"
#define kCategoryImageUrl @"url"


#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface DIECategoryModel : MTLModel <MTLJSONSerializing>

@property (nonatomic,copy) NSString *categoryId; //_id
@property (nonatomic,assign) NSInteger animeCount; //animeCount
@property (nonatomic,copy) NSString *name; //name
@property (nonatomic,assign) NSInteger height;
@property (nonatomic,assign) NSInteger width;
@property (nonatomic,copy) NSURL *url;

#if 0
//字典和数据模型对象互相转换
- (instancetype)initWithJSONDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

//简便的对象创建方法
+ (instancetype)modelfromJSONDictionary:(NSDictionary *)dictionary;
+ (NSArray *)modelsFromJSONArray:(NSArray *)array;
#endif


+ (NSArray *)modelsWithArray:(NSArray *)array;
+ (instancetype)modelWithDict:(NSDictionary *)dict;


@end
