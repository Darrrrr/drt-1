//
//  Contact.m
//  Office
//
//  Created by 东华创元 on 14-4-30.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "Contact.h"

@implementation Contact

+ (NSMutableArray *)findAllContacts
{
    __block NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:0];
    FMDatabaseQueue *queue = [DBManager queue];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        if ([db open])
        {
            FMResultSet *rs = [db executeQuery:@"select * from contact"];
            while ([rs next])
            {
                //create table contact(id integer primary key autoincrement,name text,telephone text,email text,address text)
                NSDictionary *dic = @{@"name": [rs stringForColumn:@"name"],@"telephone":[rs stringForColumn:@"telephone"],@"email": [rs stringForColumn:@"email"],@"address": [rs stringForColumn:@"address"]};
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