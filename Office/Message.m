//
//  Message.m
//  Office
//
//  Created by 东华创元 on 14-4-29.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "Message.h"

@implementation Message
+ (NSMutableArray *)findAllMessage
{
    __block NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:0];
    FMDatabaseQueue *queue = [DBManager queue];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        if ([db open])
        {
            FMResultSet *rs = [db executeQuery:@"select * from message"];
            while ([rs next])
            {
                //create table message(id integer primary key autoincrement,user_id integer,messagecontent text,messagefrom text,messagedate text,state text)
                NSDictionary *dic = @{@"messagecontent": [rs stringForColumn:@"messagecontent"],@"messagedate":[rs stringForColumn:@"messagedate"],@"messagefrom": [rs stringForColumn:@"messagefrom"],@"messagestate": [rs stringForColumn:@"state"]};
                [mutableArray addObject:dic];
                
            }
        }
    }];
    //NSLog(@"Predo.h____mutableArray___%@",mutableArray);
    NSMutableArray *resultArray = [mutableArray copy];
    //NSLog(@"Predo.h____resultArray___%@",resultArray);
    return resultArray;
}

@end
