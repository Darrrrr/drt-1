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
    NSLog(@"MSG.h____resultArray___");
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

+ (void)addMessage:(int)toPerson withMessage:(NSString *)message{
    
    FMDatabaseQueue *queue = [DBManager queue];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        if ([db open])
        {
            //给指定的人添加MESSAGE
            //获取系统时间
            
            NSString* date;
            NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
            date = [formatter stringFromDate:[NSDate date]];
            
            //获取发件人姓名
            NSUserDefaults *local = [NSUserDefaults standardUserDefaults];
            NSString * msgfrom = [local objectForKey:@"UserName"];



            NSString *sql = [NSString stringWithFormat:@"insert into message(user_id,messagecontent,messagefrom,messagedate,state) values (\"%d\",\"%@\",\"%@\",\"%@\",\"未完成\")",toPerson, message,msgfrom,date];
            [db executeUpdate:sql];
            NSLog(@"chage status。。。。。。。。。。。。。1");
            
        }
    }];
    
}

+ (void)changeState:(int)withRow{
    
    FMDatabaseQueue *queue = [DBManager queue];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        if ([db open])
        {
            //@"update predo set state = \"完成\" where id = \"%d\" ",updateID]
            NSString *sql = [NSString stringWithFormat:@"update message set state = \"完成\" where id = \"%d\" ",withRow];
            [db executeUpdate:sql];
            NSLog(@"chage status。。。。。。。。。。。。。change");
            
        }
    }];
    
}

+ (NSString *)messageCount{

    __block NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:0];
    
    FMDatabaseQueue *queue = [DBManager queue];
    
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        if ([db open])
        {
            
            NSUserDefaults *local = [NSUserDefaults standardUserDefaults];
            NSString * userID = [local objectForKey:@"UserID"];
            //这里为啥用\"%d\",userID就不行呢？ 网上说要转成NSObject的子类 但是下面的改状态这个方法就可以
            FMResultSet *rs = [db executeQuery:@"select * from message where user_id = ? and state = \"未完成\" ",[NSNumber numberWithInt:[userID intValue]]];
            
            while ([rs next])
            {
                NSDictionary *dic = @{@"messagestate": [rs stringForColumn:@"state"]};
                [mutableArray addObject:dic];
                
            }
            
            NSLog(@"%@",mutableArray);
            
        }
    }];
    
    
    NSString *final = [NSString stringWithFormat:@"%d",mutableArray.count];
    
    if ([final isEqualToString:@"0"]) {
        final=nil;
    }
    return final;




}

@end
