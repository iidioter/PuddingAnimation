//
//  DIENewWorkManeager.h
//  布丁动画
//
//  Created by cq on 15/9/30.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DIEEror.h"
#import "AFNetworking.h"
#import "DIEToolkit.h"

typedef void(^CompletionType)(id responseObject,DIEError*error);

@interface DIENewWorkManeager : NSObject
+ (void)categoryWithOffset:(NSInteger)offset limit:(NSInteger)limit completion:(CompletionType)completion;

+ (void)animeWithCategoryId:(NSString *)categoryId withLimit:(NSInteger)limit completion:(CompletionType)completion;

@end
