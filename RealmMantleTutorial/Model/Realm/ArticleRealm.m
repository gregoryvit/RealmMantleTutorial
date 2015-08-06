//
//  ArticleRealm.m
//  RealmMantleTutorial
//
//  Created by Gregory Berngardt on 07/08/15.
//  Copyright (c) 2015 Gregory Berngardt. All rights reserved.
//

#import "ArticleRealm.h"
#import "ArticleModel.h"

@implementation ArticleRealm

- (instancetype)initWithMantleModel:(ArticleModel *)articleModel {
    self = [super init];
    if (self) {
        self.leadParagraph = articleModel.leadParagraph;
        self.url = articleModel.url;
    }
    return self;
}

@end
