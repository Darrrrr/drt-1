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
            NSString *sql1_2 = @"insert into user(id,username,password) values (\"2\",\"dhcc\",\"123456\")";
            NSString *sql2 = @"create table predo(id integer primary key autoincrement,user_id integer,predocontent text,predodate text,predodetail text,state text)";
            NSString *sql2_1 = @"insert into predo(id,user_id,predocontent,predodate,predodetail,state) values (\"1\",\"1\",\"学习iOS——segue\",\"2014.2.22\",\"学习了大量关于页面跳转的问题学会了很多很多知识，如这个跳转那个跳转\",\"未完成\")";
            NSString *sql2_2 = @"insert into predo(id,user_id,predocontent,predodate,predodetail,state) values (\"2\",\"1\",\"学习iOS——ARC\",\"2014.2.23\",\"学习了大量关于ARC的问题学会了很多很多知识，如这个ARC那个ARC\",\"未完成\")";
            NSString *sql2_3 = @"insert into predo(id,user_id,predocontent,predodate,predodetail,state) values (\"3\",\"1\",\"学习iOS——oc学习\",\"2014.2.24\",\"学习了大量关于oc的问题学会了很多很多知识，如这个oc那个oc\",\"未完成\")";
            NSString *sql2_4 = @"insert into predo(id,user_id,predocontent,predodate,predodetail,state) values (\"4\",\"2\",\"学习iOS——传递\",\"2014.2.24\",\"学习了大量关于传递的问题学会了很多很多知识，如这个传递那个传递\",\"完成\")";
            NSString *sql2_5 = @"insert into predo(id,user_id,predocontent,predodate,predodetail,state) values (\"5\",\"2\",\"学习iOS——项目作业\",\"2014.2.24\",\"学习了大量关于项目作业的问题学会了很多很多知识，如这个项目作业那个oc\",\"未完成\")";
            NSString *sql2_6 = @"insert into predo(id,user_id,predocontent,predodate,predodetail,state) values (\"6\",\"1\",\"学习iOS——进程管理\",\"2014.2.24\",\"学习了大量关于进程管理的问题学会了很多很多知识，如这个进程管理那个进程管理\",\"完成\")";
            //NSLog(@"[DBManager isTableExist]%hhd",![DBManager isTableExist:@"manager"]);
            if (![DBManager isTableExist:@"user"]) {
                NSLog(@"no manager table");
                [dataBase executeUpdate:sql1];
                NSLog(@"+++++++++++++%d",[dataBase executeUpdate:sql1]);
                NSLog(@"[DBManager isTableExist]%hhd",[DBManager isTableExist:@"manager"]);
    
            }
            
            if ([DBManager isTableExist:@"user"]) {
                if ([dataBase executeUpdate:sql1_1] && [dataBase executeUpdate:sql1_2]) {
                    NSLog(@"插入成功");
                }
                else
                {
                    NSLog(@"插入失败");
                }
                
            }
            
            if (![DBManager isTableExist:@"predo"]) {
                NSLog(@"no predo table");
                [dataBase executeUpdate:sql2];
                [dataBase executeUpdate:sql2_1];
                [dataBase executeUpdate:sql2_2];
                [dataBase executeUpdate:sql2_3];
                [dataBase executeUpdate:sql2_4];
                [dataBase executeUpdate:sql2_5];
                [dataBase executeUpdate:sql2_6];
                NSLog(@"插入六条数据");
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
