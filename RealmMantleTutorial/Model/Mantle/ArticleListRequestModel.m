//
//  ArticleListRequestModel.m
//  RealmMantleTutorial
//
//  Created by Gregory Berngardt on 06/08/15.
//  Copyright (c) 2015 Gregory Berngardt. All rights reserved.
//

#import "ArticleListRequestModel.h"

@implementation ArticleListRequestModel

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMdd";
    return dateFormatter;
}

#pragma mark - Mantle

#pragma mark JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"query": @"q",
             @"articlesFromDate" : @"begin_date",
             @"articlesToDate" : @"end_date"
             };
}

#pragma mark JSON Transformations

+ (NSValueTransformer *)articlesToDateJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [[self dateFormatter] dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [[self dateFormatter] stringFromDate:date];
    }];
}

+ (NSValueTransformer *)articlesFromDateJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [[self dateFormatter] dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [[self dateFormatter] stringFromDate:date];
    }];
}

@end
