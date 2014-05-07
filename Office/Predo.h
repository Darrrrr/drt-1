//
//  Predo.h
//  Office
//
//  Created by 东华创元 on 14-4-25.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBManager.h"

@interface Predo : NSObject

+ (NSMutableArray *)findAllPredo:(int)userID;

//+ (NSComparisonResult)compare:(NSDictionary *)otherDictionary;

+ (void)upDateStatus:(int)updateID fromStatus:(BOOL)status;

+ (NSString *)predoCount;

@end
