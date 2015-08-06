//
//  SessionManager.h
//  RealmMantleTutorial
//
//  Created by Gregory Berngardt on 06/08/15.
//  Copyright (c) 2015 Gregory Berngardt. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface SessionManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

@end
