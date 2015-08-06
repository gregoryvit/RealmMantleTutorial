//
//  ArticleModel.m
//  RealmMantleTutorial
//
//  Created by Gregory Berngardt on 06/08/15.
//  Copyright (c) 2015 Gregory Berngardt. All rights reserved.
//

#import "ArticleModel.h"

@implementation ArticleModel

#pragma mark - Mantle

#pragma mark JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"leadParagraph": @"lead_paragraph",
             @"url" : @"web_url"
             };
}


@end
