//
//  MasterViewController.m
//  RealmMantleTutorial
//
//  Created by Gregory Berngardt on 06/08/15.
//  Copyright (c) 2015 Gregory Berngardt. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

#import "ArticleListRequestModel.h"
#import "ArticleListResponseModel.h"
#import "ArticleModel.h"
#import "ArticleRealm.h"

#import "APIManager.h"
#import "RLMRealm.h"
#import "RLMResults.h"

@interface MasterViewController ()

@property RLMResults *articles;

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ArticleListRequestModel *requestModel = [ArticleListRequestModel new];
    requestModel.query = @"Basketball";
    requestModel.articlesFromDate = [[ArticleListRequestModel dateFormatter] dateFromString:@"20150701"];
    requestModel.articlesToDate = [[ArticleListRequestModel dateFormatter] dateFromString:@"20150706"];

    [[APIManager sharedManager] getArticlesWithRequestModel:requestModel success:^(ArticleListResponseModel *responseModel) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            @autoreleasepool {
                RLMRealm *realm = [RLMRealm defaultRealm];
                [realm beginWriteTransaction];
                [realm deleteAllObjects];
                [realm commitWriteTransaction];
                
                [realm beginWriteTransaction];
                [responseModel.articles enumerateObjectsUsingBlock:^(ArticleModel *articleModel, NSUInteger idx, BOOL *stop) {
                    ArticleRealm *articleRealm = [[ArticleRealm alloc] initWithMantleModel:articleModel];
                    [realm addObject:articleRealm];
                }];
                [realm commitWriteTransaction];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    RLMRealm *realmMainThread = [RLMRealm defaultRealm];
                    RLMResults *articles = [ArticleRealm allObjectsInRealm:realmMainThread];
                    self.articles = articles;
                    [self.tableView reloadData];
                });
                
            }
        });
    } failure:^(NSError *error) {
        self.articles = [ArticleRealm allObjects];
        [self.tableView reloadData];
    }];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    ArticleRealm *article = self.articles[indexPath.row];
    cell.textLabel.text = article.leadParagraph;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
