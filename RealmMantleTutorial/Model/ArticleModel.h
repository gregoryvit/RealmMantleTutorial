//
//  ArticleModel.h
//  RealmMantleTutorial
//
//  Created by Gregory Berngardt on 06/08/15.
//  Copyright (c) 2015 Gregory Berngardt. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle.h"

@interface ArticleModel : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic) NSString *leadParagraph;
@property (copy, nonatomic) NSString *url;

@end
