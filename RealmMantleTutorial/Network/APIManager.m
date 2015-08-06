//
//  APIManager.m
//  RealmMantleTutorial
//
//  Created by Gregory Berngardt on 06/08/15.
//  Copyright (c) 2015 Gregory Berngardt. All rights reserved.
//

#import "APIManager.h"
#import "Mantle.h"
#import "ArticleListRequestModel.h"
#import "ArticleListResponseModel.h"

static NSString * const kArticlesListPath = @"/svc/search/v2/articlesearch.json";
static NSString * const kApiKey = @"9df722f10d75c6f0636fd75b657d0014:16:72635462";

@implementation APIManager

- (NSURLSessionDataTask *)getArticlesWithRequestModel:(ArticleListRequestModel *)requestModel success:(void (^)(ArticleListResponseModel *))success failure:(void (^)(NSError *))failure {
    NSDictionary *parameters = [MTLJSONAdapter JSONDictionaryFromModel:requestModel error:nil];
    NSMutableDictionary *parametersWithKey = [parameters mutableCopy];
    parametersWithKey[@"api-key"] = kApiKey;
    
    return [self GET:kArticlesListPath parameters:parametersWithKey success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        NSError *error;
        ArticleListResponseModel *articlesList = [MTLJSONAdapter modelOfClass:[ArticleListResponseModel class] fromJSONDictionary:responseObject error:&error];
        success(articlesList);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

@end
