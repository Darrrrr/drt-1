//
//  NSDate + CalendarGrid.h
//  Office
//
//  Created by 东华创元 on 14-5-7.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CalendarGrid)

- (NSDate *) firstOfMonthWithTimeZone:(NSTimeZone *)timeZone;
- (NSDate *) nextMonthWithTimeZone:(NSTimeZone *)timeZone;
- (NSDate *) previousMonthWithTimeZone:(NSTimeZone *)timeZone;

- (NSDate *) lastOfMonthDateWithTimeZone:(NSTimeZone *)timeZone;
+ (NSDate *) lastofMonthDateWithTimeZone:(NSTimeZone *)timeZone;
+ (NSDate *) lastOfCurrentMonthWithTimeZone:(NSTimeZone *)timeZone;

@end
