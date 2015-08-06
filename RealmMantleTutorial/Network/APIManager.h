//
//  APIManager.h
//  RealmMantleTutorial
//
//  Created by Gregory Berngardt on 06/08/15.
//  Copyright (c) 2015 Gregory Berngardt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SessionManager.h"

@class ArticleListRequestModel;
@class ArticleListResponseModel;

@interface APIManager : SessionManager

- (NSURLSessionDataTask *) getArticlesWithRequestModel:(ArticleListRequestModel *)requestModel success:(void (^)(ArticleListResponseModel *responseModel))success failure:(void (^)(NSError *error))failure;


@end
