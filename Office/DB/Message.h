//
//  Message.h
//  Office
//
//  Created by 东华创元 on 14-4-29.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBManager.h"

@interface Message : NSObject

+ (NSMutableArray *)findAllMessage:(int)userID;
+ (void)deleteMessage:(int)withRow;
+ (void)addMessage:(int)toPerson withMessage:(NSString *)message;


+ (void)changeState:(int)withRow;

+ (NSString *)messageCount;

@end
