//
//  DBManager.h
//  Office
//
//  Created by 东华创元 on 14-4-23.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
#import "Config.h"

@interface DBManager : NSObject

/**数据库对象单例方法**/
+ (FMDatabase *)createDataBase;

/**数据库Queue方法**/
+ (FMDatabaseQueue *)queue;

/**关闭数据库**/
+ (void)closeDataBase;

/**清空数据库内容**/
+ (void)deleteDataBase;

/**判断表是否存在**/
+ (BOOL) isTableExist:(NSString *)tableName;

- (BOOL) createTable;
@end
