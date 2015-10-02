//
//  DIECategoryModel.m
//  布丁动画
//
//  Created by cq on 15/9/29.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIECategoryModel.h"

@implementation DIECategoryModel

///////////////////////////////
#if 0
- (instancetype)initWithJSONDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        _categoryId = dictionary[kCategoryId];
        _name = dictionary[kCategoryName];
        _animeCount = [dictionary[kCategoryAnimeCount] integerValue];
        NSDictionary *imageDict = dictionary[kCategoryImage];
        _width = [imageDict[kCategoryImageWidth] intValue];
        _height = [imageDict[kCategoryImageHeight] intValue];
        //获取图片地址转换类型
        _url = [NSURL URLWithString:imageDict[kCategoryImageUrl]];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return @{kCategoryId:_categoryId,
             kCategoryName:_name,
             kCategoryImage:@{
                 kCategoryImageWidth:@(_width),
                 kCategoryImageHeight:@(_height),
                 kCategoryImageUrl:_url.absoluteString
                 }
            };
}

+ (instancetype)modelfromJSONDictionary:(NSDictionary *)dictionary
{
    return [[self alloc] initWithJSONDictionary:dictionary];
}

+ (NSArray *)modelsFromJSONArray:(NSArray *)array
{
    NSMutableArray *models = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [models addObject:[self modelfromJSONDictionary:dict]];
    }
    return [models copy];
}
#endif
///////////////////////////

#pragma mark MTLJSONSerializing
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    //头文件中定义的属性 < : > JSON字典中的key
    return @{
             @"categoryId": @"_id",
             @"name": @"name",
             @"animeCount": @"animeCount",
             @"width": @"image.width",
             @"height": @"image.height",
             @"url": @"image.url"
             };
}

            //实用    方法
#pragma mark Utility methods
+ (instancetype)modelWithDict:(NSDictionary *)dict{
    return [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:dict error:nil];
}

+ (NSArray *)modelsWithArray:(NSArray *)array{
   return [MTLJSONAdapter modelsOfClass:[self class] fromJSONArray:array error:nil]; 
}



@end