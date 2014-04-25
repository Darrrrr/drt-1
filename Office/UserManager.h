//
//  UserManager.h
//  Office
//
//  Created by 东华创元 on 14-4-23.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBManager.h"
@interface UserManager : NSObject

@property (nonatomic, copy) NSString *userID;//用户的ID
- (BOOL)checkUsername:(NSString *)username andcheckPassword:(NSString *)password;

@end
