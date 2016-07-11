//
//  DataBaseManager.m
//  豆瓣
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 fwlong. All rights reserved.
//

#import "DataBaseManager.h"
#import "ModelForListen.h"

@implementation DataBaseManager

#pragma mark - 知识点 1 单例

+ (instancetype)shareDataBaseHandler {
    
    //在静态区,只初始化一次 创建数据库对象
    
    static DataBaseManager *dataBase = nil;
    
    if (dataBase == nil) {
        
        dataBase = [[DataBaseManager alloc] init];
        
    }
    
    return dataBase;
    
}

/** 定义一个 sqlite 结构体 (对象) */

sqlite3 *db;

#pragma mark - 知识点 2 :打开数据库

- (void)open{
    
    // API: sqlite3_open
    
    if (db != nil) {
        
        NSLog(@"数据库已经开启");
        
        return;
        
    }
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"model.sqlite"];
    
    NSLog(@"%@",file);
    
    /**
     
     * @praram filename 数据库文件的路径(注意!类型为 c 字符串)
     
     *
     
     * @param ppDb 数据库对象
     
     *
     
     **/
    
    int result = sqlite3_open(file.UTF8String, &db);
    
    if (result == SQLITE_OK) {
        
        NSLog(@"数据库打开成功");
        
    }else{
        
        NSLog(@"数据打开失败, code = %d", result);
        
    }
    
}

#pragma mark - 知识点 3 创建表格

- (void)createTable{
    
    // API: sqlite3_exec
    
    // 创建 SQL 语句.
    
    //////////////
    
    NSString *createTableSQL = @"CREATE TABLE IF NOT EXISTS test(number INTEGER PRIMARY KEY AUTOINCREMENT, currentTitle text, currentURL text,currentID  text)";
    
    int result = sqlite3_exec(db, createTableSQL.UTF8String, NULL, NULL, nil);
    
    if (result == SQLITE_OK) {
        
        NSLog(@"创建表格成功");
        
    }else{
        
        NSLog(@"创建表格失败. code :%d", result);
        
    }
    
}

#pragma mark - 知识点 4 插入数据

- (void)insertModel:(ModelForListen *)model {
    
    // API :sqlite3_exec
    
    /////////////
    
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT into test(currentTitle,currentURL,currentID) VALUES('%@', '%@', '%@')", model.currentTitle, model.currentURL , model.currentID];
    
    int result = sqlite3_exec(db, insertSQL.UTF8String, nil, nil, nil);
    
    if (result == SQLITE_OK) {
        
        NSLog(@"添加数据完成");
        
    }else{
        
        NSLog(@"添加数据失败.code:%d", result);
        
    }
    
}

#pragma mark - 知识点 5 更新数据

- (void)updataModel:(ModelForListen *)model ForNumber:(NSInteger)number{
    
    //API :sqlite2_exec
    
    NSString *updataSQL = [NSString stringWithFormat:@"UPDATE test SET currentTitle = '%@', currentURL = '%@', currentID = '%@' WHERE number = '%ld'",model.currentTitle, model.currentURL , model.currentID,number];
    
    int result = sqlite3_exec(db, updataSQL.UTF8String, nil, nil, nil);
    
    if (result == SQLITE_OK) {
        
        NSLog(@"更新成功");
        
    }else {
        
        NSLog(@"更新失败, code:%d", result);
        
    }
    
}
#pragma mark -- 知识点 6 :删除数据

- (void)deleteWithID:(NSString *)ID {
    
    //API sqlite3_exec
    
    NSString *deleteSQL = [NSString stringWithFormat:@"DELETE FROM test WHERE currentID = '%@'",ID];
    
    int result = sqlite3_exec(db, deleteSQL.UTF8String, nil, nil, nil);
    
    if (result == SQLITE_OK) {
        
        NSLog(@"删除成功");
        
    }else{
        
        NSLog(@"删除失败 code:%d", result);
        
    }
    
}

- (void)deleteWithModel:(ModelForListen *)model {
    
    NSString *deleteSQL = [NSString stringWithFormat:@"DELETE FROM test WHERE currentID = '%@'",model.currentTitle];
    
    int result = sqlite3_exec(db, deleteSQL.UTF8String, nil, nil, nil);
    
    if (result == SQLITE_OK) {
        
        NSLog(@"删除成功");
        
    }else{
        
        NSLog(@"删除失败 code:%d", result);
        
    }
    
}

#pragma mark --知识点 7  查询数据

- (NSArray *)selectForID:(NSString *)ID{
    
    /** 存放符合条件的查询数据 (元素是 model 对象)*/
    
    NSMutableArray *arr = [NSMutableArray array];
    
    // sql 语句
    
    NSString *selectSQL = [NSString stringWithFormat:@"SELECT * FROM test WHERE currentID = '%@'", ID];
    
    NSLog(@"------%@",selectSQL);
    NSLog(@">>>>>>%s",selectSQL.UTF8String);
    //API : stmt 结构体, sqlite3_prepareV2,sqlite3_step, sqlite_column
    
    // 声明一个结构体 stmt 对象 (结构体)
    
    sqlite3_stmt *stmt = nil;
    
    //(准备好的语句对象)
    
    int result = sqlite3_prepare_v2(db, selectSQL.UTF8String, -1, &stmt, nil);
    
    if (result == SQLITE_OK) {
        
        // 逐行查询 每行都执行查询语句
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            // 如果查询条件匹配, 通过 sqlite3_column 函数蔟 取出值;
            
            const unsigned char *currentTitle = sqlite3_column_text(stmt, 1);// 取出哪一列的数据值
            
            const unsigned char *currentURL = sqlite3_column_text(stmt, 2);
            
            const unsigned char *currentID = sqlite3_column_text(stmt, 3);
            
      
            //          int age = sqlite3_column_int(stmt, 3);
            
            // 创建 model 对象, 赋值之后放入数组中
            
            ModelForListen *model = [[ModelForListen alloc] init];
            
            model.currentTitle = [NSString stringWithUTF8String:(const char *) currentTitle];
            
            model.currentURL = [NSString stringWithUTF8String:(const char*) currentURL];
            
            model.currentID = [NSString stringWithUTF8String:(const char*) currentID];
            

            
            [arr addObject:model];
            
        }
        
        NSLog(@"准备就绪,查询中...");
        
        // 销毁对象
        
        sqlite3_finalize(stmt);
        
    }else {
        
        NSLog(@"不能正常查询, code:%d", result);
        
        // 销毁对象
        
        sqlite3_finalize(stmt);
        
    }
    
    return arr;
    
}

- (NSArray *)selectForModel {
    
    /** 存放符合条件的查询数据 (元素是 model 对象)*/
    
    NSMutableArray *arr = [NSMutableArray array];
    
    // sql 语句
    
    NSString *selectSQL = [NSString stringWithFormat:@"SELECT * FROM test"];
    
    //API : stmt 结构体, sqlite3_prepareV2,sqlite3_step, sqlite_column
    
    // 声明一个结构体 stmt 对象 (结构体)
    
    sqlite3_stmt *stmt = nil;
    
    //(准备好的语句对象) -1 代表查询全部对象.
    
    int result = sqlite3_prepare_v2(db, selectSQL.UTF8String, -1, &stmt, nil);
    
    if (result == SQLITE_OK) {
        
        // 逐行查询 每行都执行查询语句
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            // 如果查询条件匹配, 通过 sqlite3_column 函数蔟 取出值;
            
            const unsigned char *currentTitle = sqlite3_column_text(stmt, 1);// 取出哪一列的数据值
            
            const unsigned char *currentURL = sqlite3_column_text(stmt, 2);
            
            const unsigned char *currentID = sqlite3_column_text(stmt, 3);
            

            //          int age = sqlite3_column_int(stmt, 3);
            
            // 创建 model 对象, 赋值之后放入数组中
            
            ModelForListen *model = [[ModelForListen alloc] init];
            
            model.currentTitle = [NSString stringWithUTF8String:(const char *) currentTitle];
            
            model.currentURL = [NSString stringWithUTF8String:(const char*) currentURL];
            
            model.currentID = [NSString stringWithUTF8String:(const char*) currentID];
            
            
            [arr addObject:model];
            
        }
        
        NSLog(@"准备就绪,查询中...");
        
        // 销毁对象
        
        sqlite3_finalize(stmt);
        
    }else {
        
        NSLog(@"不能正常查询, code:%d", result);
        
        // 销毁对象
        
        sqlite3_finalize(stmt);
        
    }
    
    return arr;
    
}

#pragma mark --知识点 8 删除表单

-(void)dropTable{
    
    NSString *dropSQL = @"DROP TABLE test";
    
    int result = sqlite3_exec(db, dropSQL.UTF8String, nil, nil, nil);
    
    if (result == SQLITE_OK) {
        
        NSLog(@"删除表格成功!!!!");
        
    }else{
        
        NSLog(@"删除失败");
        
    }
    
}

#pragma mark --关掉数据库

- (void)closeDB {
    
    // API:sqlite3_close
    
    int result = sqlite3_close(db);
    
    if (result == SQLITE_OK) {
        
        NSLog(@"数据库关闭成功");
        
        db = nil;
        
    }else{
        
        NSLog(@"数据库关闭失败. code :%d", result);
        
    }
    
}





@end
