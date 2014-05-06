//
//  UserManager.m
//  Office
//
//  Created by 东华创元 on 14-4-23.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

- (int)checkUsername:(NSString *)username andcheckPassword:(NSString *)password
{
    FMDatabase *dataBase = [DBManager createDataBase];
    int isFind = 0;
    if ([dataBase open]) {
        NSLog(@"---------%@,%@",username,password);
        NSString *sql = [NSString stringWithFormat:@"select * from user where username=\"%@\" and password=\"%@\"",username,password];
        NSLog(@"---------%@",sql);
        FMResultSet *rs = [dataBase executeQuery:sql];
        NSLog(@"%@",rs);
        
        if ([rs next]) {
            
            isFind = [rs intForColumn:@"id"];
        }
        [dataBase close];
    }
    return isFind;
    
}
+ (int)checkUserExist:(NSString *)username{
    
    FMDatabase *dataBase = [DBManager createDataBase];
    int isFind = -1;
    if ([dataBase open]) {
        
        NSString *sql = [NSString stringWithFormat:@"select * from user where username=\"%@\" ",username];
        NSLog(@"---------%@",sql);
        FMResultSet *rs = [dataBase executeQuery:sql];
        NSLog(@"%@",rs);
        
        if ([rs next]) {
            
            isFind = [rs intForColumn:@"id"];
        }
        [dataBase close];
    }
    return isFind;
    
}

@end
