//
//  Message.m
//  Office
//
//  Created by 东华创元 on 14-4-29.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "Message.h"

@implementation Message
+ (NSMutableArray *)findAllMessage:(int)userID
{
    __block NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:0];
    FMDatabaseQueue *queue = [DBManager queue];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        if ([db open])
        {
            FMResultSet *rs = [db executeQuery:@"select * from message where user_id = ? ",[NSNumber numberWithInt:userID]];
            while ([rs next])
            {
                //create table message(id integer primary key autoincrement,user_id integer,messagecontent text,messagefrom text,messagedate text,state text)
                NSDictionary *dic = @{@"messagecontent": [rs stringForColumn:@"messagecontent"],@"messagedate":[rs stringForColumn:@"messagedate"],@"messagefrom": [rs stringForColumn:@"messagefrom"],@"messagestate": [rs stringForColumn:@"state"],@"messageid": [rs stringForColumn:@"id"]};
                [mutableArray addObject:dic];
                
            }
        }
    }];
    //NSLog(@"Predo.h____mutableArray___%@",mutableArray);
    NSMutableArray *resultArray = [mutableArray mutableCopy];
    //NSLog(@"Predo.h____resultArray___%@",resultArray);
    return resultArray;
}

+ (void)deleteMessage:(int)withRow{

    FMDatabaseQueue *queue = [DBManager queue];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        if ([db open])
        {
            
            NSString *sql = [NSString stringWithFormat:@"delete from message where id = \"%d\" ",withRow];
            [db executeUpdate:sql];
            NSLog(@"chage status。。。。。。。。。。。。。1");
            
        }
    }];

}

+ (void)addMessage:(int)toPerson{

    FMDatabaseQueue *queue = [DBManager queue];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        if ([db open])
        {
            //给指定的人添加MESSAGE
            NSString *sql = [NSString stringWithFormat:@"insert into message(user_id,messagecontent,messagefrom,messagedate,state) values (\"1\",\"学习iOS——segue/n学习了大量关于页面跳转的问题学会了很多很多知识，如这个跳转那个跳转\",\"msgfrom:123\",\"2014.2.22\",\"未完成\")"];
            [db executeUpdate:sql];
            NSLog(@"chage status。。。。。。。。。。。。。1");
            
        }
    }];

}

@end
