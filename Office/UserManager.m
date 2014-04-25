//
//  UserManager.m
//  Office
//
//  Created by 东华创元 on 14-4-23.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

- (BOOL)checkUsername:(NSString *)username andcheckPassword:(NSString *)password
{
    FMDatabase *dataBase = [DBManager createDataBase];
    BOOL isFind = NO;
    if ([dataBase open]) {
        NSLog(@"---------%@,%@",username,password);
        NSString *sql = [NSString stringWithFormat:@"select * from user where username=\"%@\" and password=\"%@\"",username,password];
        NSLog(@"---------%@",sql);
        FMResultSet *rs = [dataBase executeQuery:sql];
        NSLog(@"%@",rs);

        if ([rs next]) {
            
            isFind = YES;
        }
        [dataBase close];
    }
    return isFind;
    
}

@end
