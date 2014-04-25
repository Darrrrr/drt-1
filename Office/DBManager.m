//
//  DBManager.m
//  Office
//
//  Created by 东华创元 on 14-4-23.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "DBManager.h"
static FMDatabase *dataBase = nil;

@implementation DBManager
/**数据库对象单例方法**/
+ (FMDatabase *) createDataBase
{
    //A predicate for use with the dispatch_once function.
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,
                  ^{
                      dataBase = [FMDatabase databaseWithPath:dataBasePath];
                  });
    NSLog(@"创建数据库%@",dataBasePath);
    return dataBase;
}
/**数据库Queue方法**/
+ (FMDatabaseQueue *)queue
{
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:dataBasePath];
    return queue;
}


/**关闭数据库**/
+ (void)closeDataBase
{
    if (![dataBase close]) {
        NSLog(@"数据库关闭异常，请检查");
        return;
    }
}

/**清空数据库内容**/
+ (void)deleteDataBase
{
    
}

/**判断表是否存在**/
+ (BOOL) isTableExist:(NSString *)tableName
{
    //NSLog(@"============>%d",[dataBase open]);
    FMResultSet *rs = [dataBase executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
    while ([rs next]) {
        NSInteger count = [rs intForColumn:@"count"];
        NSLog(@"%@ isOK %d", tableName,count);
        if (0 == count)
        {
            return NO;
        }
        else
        {
            return YES;
        }
    }
    return NO;
}

- (BOOL) createTable
{
    if (1) {
        dataBase = [DBManager createDataBase];
        if ([dataBase open]) {
            // autoincrement不能用
            NSString *sql1 = @"create table user(id integer primary key,username text,password text)";
            NSString *sql1_1 = @"insert into user(id,username,password) values (\"1\",\"admin\",\"123456\")";
            NSString *sql2 = @"create table predo(id integer primary key autoincrement,user_id integer,predocontent text,predodate text)";
            //NSLog(@"[DBManager isTableExist]%hhd",![DBManager isTableExist:@"manager"]);
            if (![DBManager isTableExist:@"user"]) {
                NSLog(@"no manager table");
                [dataBase executeUpdate:sql1];
                NSLog(@"+++++++++++++%d",[dataBase executeUpdate:sql1]);
                NSLog(@"[DBManager isTableExist]%hhd",[DBManager isTableExist:@"manager"]);
                if ([dataBase executeQuery:sql1_1]) {
                    NSLog(@"插入成功");
                }
                else
                {
                    NSLog(@"插入成功");
                }
    
            }
            
            if ([DBManager isTableExist:@"user"]) {
                if ([dataBase executeUpdate:sql1_1]) {
                    NSLog(@"插入成功");
                }
                else
                {
                    NSLog(@"插入成功");
                }
                
            }
            
            if (![DBManager isTableExist:@"predo"]) {
                NSLog(@"no predo table");
                [dataBase executeUpdate:sql2];
            }
            if (![DBManager isTableExist:@"user"] && ![DBManager isTableExist:@"predo"]) {
                NSLog(@"创建表失败");
            }
            else
            {
                NSLog(@"成功创建表");
            }
            [dataBase setShouldCacheStatements:YES];
        }
        else
        {
            NSLog(@"打开数据库时出现错误");
            return NO;
        }
    }
    else
    {
        NSLog(@"数据库不存在");
        return NO;
    }
    return YES;
}


@end
