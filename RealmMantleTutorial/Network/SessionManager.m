//
//  SessionManager.m
//  RealmMantleTutorial
//
//  Created by Gregory Berngardt on 06/08/15.
//  Copyright (c) 2015 Gregory Berngardt. All rights reserved.
//

#import "SessionManager.h"

static NSString * const kBaseURL = @"http://api.nytimes.com";

@implementation SessionManager

- (id)init {
    self = [super initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}

+ (instancetype)sharedManager {
    static SessionManager * _sessionManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sessionManager = [[self alloc] init];
    });
    
    return _sessionManager;
}

@end
