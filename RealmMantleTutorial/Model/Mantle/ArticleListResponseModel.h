//
//  ArticleListResponseModel.h
//  RealmMantleTutorial
//
//  Created by Gregory Berngardt on 06/08/15.
//  Copyright (c) 2015 Gregory Berngardt. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle.h"
#import "ArticleModel.h"

@interface ArticleListResponseModel : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic) NSArray *articles;
@property (copy, nonatomic) NSString *status;

@end
