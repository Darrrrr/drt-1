//
//  NSDate + Category.h
//  Office
//
//  Created by 东华创元 on 14-5-7.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - NSDate + Category
@interface NSDate (Category)

#pragma mark Yesterday
/*******************
 创建并返回一个新的日期设置在前天和当前时间
 @return 一个‘NSDate’对象设置yesterday
 *******************/
+ (NSDate *) yesterday;

/*******************
 @param timeZone 时间区间
 @return 一个‘NSDate’对象设置yesterday
 *******************/
+ (NSDate *) yesterdayWithTimeZone:(NSTimeZone *)timeZone;

#pragma mark Tomorrow
/*******************
 创建并返回一个新的日期设置在明天和当前时间
 @return 一个‘NSDate’对象设置tomorrow
 *******************/
+ (NSDate *) tomorrow;

/*******************
 @param timeZone 时间区间
 @return 一个‘NSDate’对象设置tomorrow
 *******************/
+ (NSDate *) tomorrowWithTimeZone:(NSTimeZone *)timeZone;

#pragma mark Month
/*******************
 @return 一个‘NSDate’对象设置当前月
 *******************/
+ (NSDate *) month;

/*******************
 @param timeZone 时间区间
 @return 一个‘NSDate’对象设置当前月
 *******************/
+ (NSDate *) monthWithTimeZone:(NSTimeZone *)timeZone;

/*******************
 @return 一个‘NSDate’对象设置相同月作为时间对象。这天是每月1号
 *******************/
- (NSDate*) monthDate;

/*******************
 @param timeZone 时间区间
 @return 一个‘NSDate’对象设置相同月作为时间对象。这天是每月1号
 *******************/
- (NSDate *) monthDateWithTimeZone:(NSTimeZone *)timeZone;

#pragma mark Same Day
/*******************
 @param anotherDate 用来比较时间
 @return YES（两个时间同年月日）
 *******************/
- (BOOL) isSameDay:(NSDate *)anotherDate;

/*******************
 @param anotherDate 用来比较时间
 @param timeZone 时间区间用来决定当前日期
 @return YES（两个时间同年月日）
 *******************/
- (BOOL) isSameDay:(NSDate *)anotherDate timeZone:(NSTimeZone *)timeZone;

#pragma mark Same Month
/*******************
 @param anotherDate 用来比较时间
 @return YES（两个时间同年月）
 *******************/
- (BOOL) isSameMonth:(NSDate *)anotherDate;

/*******************
 @param anotherDate 用来比较时间
 @param timeZone 时间区间用来决定当前日期
 @return YES（两个时间同年月）
 *******************/
- (BOOL) isSameMonth:(NSDate *)anotherDate timeZone:(NSTimeZone *)timeZone;

#pragma mark Same Year
/*******************
 @param anotherDate 用来比较时间
 @return YES（两个时间同年）
 *******************/
- (BOOL) isSameYear:(NSDate *)anotherDate;

/*******************
 @param anotherDate 用来比较时间
 @param timeZone 时间区间用来决定当前日期
 @return YES（两个时间同年）
 *******************/
- (BOOL) isSameYear:(NSDate *)anotherDate timeZone:(NSTimeZone *)timeZone;

#pragma mark Month and Days Between
/*******************
 @param date 用来比较时间
 @return 两日期间的月份数
 *******************/
- (NSInteger) monthsBetweenDate:(NSDate *)date;

/*******************
 @param toDate 另一个时间比较
 @param timeZone 时间区间用来决定当前日期
 @return YES（两个时间同年）
 *******************/
- (NSInteger) monthsBetweenDate:(NSDate *)toDate timeZone:(NSTimeZone *)timeZone;

- (NSInteger) daysBetweenDate:(NSDate*)date;

#pragma mark Is Today
/*******************
 @return YES（时间对象是现在的时间）
 *******************/
- (BOOL) isToday;

/*******************
 @param timeZone 时间区间
 @return YES（时间对象是现在的时间）
 *******************/
- (BOOL) isTodayWithTimeZone:(NSTimeZone *)timeZone;

/*******************
 @return YES（时间对象是明天）
 *******************/
- (BOOL) isTomorrow;

/*******************
 @param timeZone 时间区间
 @return YES（时间对象是明天）
 *******************/
- (BOOL) isTomorrowWithTimeZone:(NSTimeZone *)timeZone;

/*******************
 @return YES（时间对象是昨天）
 *******************/
- (BOOL) isYesterday;

/*******************
 @param timeZone 时间区间
 @return YES（时间对象是昨天）
 *******************/
- (BOOL) isYesterdayWithTimeZone:(NSTimeZone *)timeZone;

#pragma mark Month & Year String
/*******************
 @return NSString对象，当地年月 NSDate类型
 *******************/
- (NSString *) monthYearString;

/*******************
 @param timeZone 时间区间
 @return NSString对象，当地年月 NSDate类型
 *******************/
- (NSString *) monthYearStringWithTimeZone:(NSTimeZone *)timeZone;

/*******************
 @return NSString对象，当地月 NSDate类型
 *******************/
- (NSString *) monthString;

/*******************
 @param timeZone 时间区间
 @return NSString对象，当地月 NSDate类型
 *******************/
- (NSString *) monthStringWithTimeZone:(NSTimeZone *)timeZone;

/*******************
 @return NSString对象，当地年 NSDate类型
 *******************/
- (NSString *) yearString;

/*******************
 @param timeZone 时间区间
 @return NSString对象，当地年 NSDate类型
 *******************/
- (NSString *) yearStringWithTimeZone:(NSTimeZone *)timeZone;

#pragma mark Date Compontents
/*******************
 @param components 信息用来创建日期
 @return NSDate
 *******************/
+ (NSDate *) dateWithDateComponents:(NSDateComponents *)components;

/*******************
 @param timeZone 时间区间
 @return NSDateComponents对象
 *******************/
- (NSDateComponents *) dateComponentsWithTimeZone:(NSTimeZone *)timeZone;

- (NSDate *) dateByAddingDays:(NSUInteger)days;
+ (NSDate *) dateWithDatePart:(NSDate *)aDate andTimePart:(NSDate *)aTime;


+ (NSDate*) firstDateOfWeekWithTimeZone:(NSTimeZone*)timeZone;
+ (NSDate*) firstDateOfWeek;
- (NSDate*) firstDateOfWeekWithTimeZone:(NSTimeZone*)timeZone;
- (NSDate*) firstDateOfWeek;

@end
