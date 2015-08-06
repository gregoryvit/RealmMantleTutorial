//
//  ArticleListRequestModel.h
//  RealmMantleTutorial
//
//  Created by Gregory Berngardt on 06/08/15.
//  Copyright (c) 2015 Gregory Berngardt. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle.h"

@interface ArticleListRequestModel : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic) NSString *query;
@property (copy, nonatomic) NSDate *articlesFromDate;
@property (copy, nonatomic) NSDate *articlesToDate;

@end
