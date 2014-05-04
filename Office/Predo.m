//
//  Predo.m
//  Office
//
//  Created by 东华创元 on 14-4-25.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "Predo.h"

@implementation Predo

+ (NSMutableArray *)findAllPredo:(int)userID
{
    __block NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:0];
   
    FMDatabaseQueue *queue = [DBManager queue];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        if ([db open])
        {
         
            //这里为啥用\"%d\",userID就不行呢？ 网上说要转成NSObject的子类 但是下面的改状态这个方法就可以
            FMResultSet *rs = [db executeQuery:@"select * from predo where user_id = ? ",[NSNumber numberWithInt:userID]];
           // FMResultSet *rs = [db executeQuery:@"select * from predo where user_id = \"%d\"",userID];
            NSLog(@"select * from predo where user_id = \"%d\" ",userID);
            while ([rs next])
            {
                //create table predo(id integer primary key autoincrement,user_id integer,predocontent text,predodate text,predodetail text,state boolen
                NSDictionary *dic = @{@"predocontent": [rs stringForColumn:@"predocontent"],@"predodate":[rs stringForColumn:@"predodate"],@"predodetail": [rs stringForColumn:@"predodetail"],@"predostate": [rs stringForColumn:@"state"],@"predoid": [rs stringForColumn:@"id"]};
                [mutableArray addObject:dic];
            }
        }
    }];
    //NSLog(@"Predo.h____mutableArray___%@",mutableArray);
   NSMutableArray *resultArray = [mutableArray copy];
    NSLog(@"Predo.h____resultArray___%@  with id = %d",resultArray,userID);
    return resultArray;
}

+ (void)upDateStatus:(int)updateID  fromStatus:(BOOL)status{

    
    FMDatabaseQueue *queue = [DBManager queue];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        if ([db open])
        {
            
        
        
        
            
                   NSString *sql = [NSString stringWithFormat:@"update predo set state = \"完成\" where id = \"%d\" ",updateID];
            
                   NSString *sql1 = [NSString stringWithFormat:@"update predo set state = \"未完成\" where id = \"%d\" ",updateID];
            
                    if(status){
            
                    [db executeUpdate:sql];
                       NSLog(@"chage status。。。。。。。。。。。。。1");
                   }
                   else
                   {
                   [db executeUpdate:sql1];
                   NSLog(@"chage status。。。。。。。。。。。。。2");
                   }

        
        
        }
    }];

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
