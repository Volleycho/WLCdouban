//
//  DataBaseManager.h
//  豆瓣
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 fwlong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@class ModelForListen;
@interface DataBaseManager : NSObject

+(instancetype)shareDataBaseHandler;

//@property (strong,nonatomic)UIWebView *webView;
//@property (strong,nonatomic)NSString *currentURL;
//@property (strong,nonatomic)NSString *currentTitle;
//@property (strong,nonatomic)NSString *currentHTML;


//- (void)webViewDidFinishLoad:(UIWebView *)webView;

- (void)open;

- (void)createTable;

- (void)insertModel:(ModelForListen *) model;

- (void)updataModel:(ModelForListen *)model ForNumber:(NSInteger)number;

- (void)deleteWithID:(NSString *)ID;

- (void)deleteWithModel:(ModelForListen *)model;

- (NSArray *)selectForID:(NSString *)ID;

- (NSArray *)selectForModel;

- (void)dropTable;

- (void)closeDB;


@end
