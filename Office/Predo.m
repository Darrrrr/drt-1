//
//  Predo.m
//  Office
//
//  Created by 东华创元 on 14-4-25.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "Predo.h"

@implementation Predo

+ (NSMutableArray *)findAllPredo
{
    __block NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:0];
   
    FMDatabaseQueue *queue = [DBManager queue];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        if ([db open])
        {
            FMResultSet *rs = [db executeQuery:@"select * from predo"];
            while ([rs next])
            {
                //create table predo(id integer primary key autoincrement,user_id integer,predocontent text,predodate text,predodetail text,state boolen
                NSDictionary *dic = @{@"predocontent": [rs stringForColumn:@"predocontent"],@"predodate":[rs stringForColumn:@"predodate"],@"predodetail": [rs stringForColumn:@"predodetail"],@"predostate": [rs stringForColumn:@"state"]};
                [mutableArray addObject:dic];
            }
        }
    }];
    //NSLog(@"Predo.h____mutableArray___%@",mutableArray);
   NSMutableArray *resultArray = [mutableArray copy];
    //NSLog(@"Predo.h____resultArray___%@",resultArray);
    return resultArray;
}

+ (void)upDateStatus:(int)updateID  fromStatus:(BOOL)status{
    
   FMDatabase *dataBase = [DBManager createDataBase];


    if ([dataBase open]) {
       
        NSString *sql = [NSString stringWithFormat:@"update predo set state = \"完成\" where id = \"%d\" ",updateID+1];
        
        NSString *sql1 = [NSString stringWithFormat:@"update predo set state = \"未完成\" where id = \"%d\" ",updateID+1];
       
        if(status){
        
         [dataBase executeUpdate:sql];
            NSLog(@"chage status。。。。。。。。。。。。。1");
        }
        else
        {
        [dataBase executeUpdate:sql1];
        NSLog(@"chage status。。。。。。。。。。。。。2");
        }
        [dataBase close];
        
    
                 
    }


}


//+(NSComparisonResult)compare:(NSDictionary *)otherDictionary
//{
//    NSDictionary *tempDictionary = (NSDictionary *)self;
//    
//    NSNumber *number1 = [[tempDictionary allKeys] objectAtIndex:0];
//    NSNumber *number2 = [[otherDictionary allKeys] objectAtIndex:0];
//    
//    NSComparisonResult result = [number1 compare:number2];
//    
//    return result == NSOrderedDescending; // 升序
//}
@end
