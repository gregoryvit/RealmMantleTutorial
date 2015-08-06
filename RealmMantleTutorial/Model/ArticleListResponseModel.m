//
//  ArticleListResponseModel.m
//  RealmMantleTutorial
//
//  Created by Gregory Berngardt on 06/08/15.
//  Copyright (c) 2015 Gregory Berngardt. All rights reserved.
//

#import "ArticleListResponseModel.h"

@class ArticleModel;

@implementation ArticleListResponseModel

#pragma mark - Mantle

#pragma mark JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"articles": @"response.docs",
             @"status" : @"status"
             };
}

#pragma mark JSON Transformations

+ (NSValueTransformer *)articlesJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[ArticleModel class]];
}

@end
