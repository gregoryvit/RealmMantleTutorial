//
//  ArticleRealm.h
//  RealmMantleTutorial
//
//  Created by Gregory Berngardt on 07/08/15.
//  Copyright (c) 2015 Gregory Berngardt. All rights reserved.
//

#import "RLMObject.h"

@class ArticleModel;

@interface ArticleRealm : RLMObject

@property NSString *leadParagraph;
@property NSString *url;

- (instancetype)initWithMantleModel:(ArticleModel *)articleModel;

@end
