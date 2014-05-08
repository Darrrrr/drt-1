//
//  CalendarMonthView.h
//  Office
//
//  Created by 东华创元 on 14-5-7.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Global.h"
#import "NSDate + Category.h"
#import "NSDate + CalendarGrid.h"
#import "UIColor + Category.h"
#import "GradientView.h"
#import "UIView + Category.h"
#import "UIImage + Category.h"
#import "UIImageView + Category.h"

@protocol CalendarMonthViewDelegate, CalendarMonthViewDataSource;

#pragma mark - CalendarMonthView
@interface CalendarMonthView : UIView

/*******************
 @param timeZone 网格时间区间
 @return 一个‘CalendarMonthView’对象或者返回nil
 *******************/
- (id) initWithTimeZone: (NSTimeZone *)timeZone;

/*******************
 @param sunday 设置网格最左边的日子为星期一或者星期天
 @return 一个‘CalendarMonthView’对象或者返回nil
 *******************/
- (id) initWithSundayAsFirst: (BOOL)sunday;

/*******************
 @param sunday 设置网格最左边的日子为星期一或者星期天
 @param timeZone 网格时间区间
 @return 一个‘CalendarMonthView’对象或者返回nil
 *******************/
- (id) initWithSundayAsFirst: (BOOL)sunday timeZone:(NSTimeZone *)timeZone;

/*******************
 这个代理必须采用‘CalendarMonthViewDelegate’协议
 这个代理不能被保留
 *******************/
@property (nonatomic, assign) id<CalendarMonthViewDelegate> delegate;

/*******************
 这个数据资源必须采用‘CalendarMonthViewDataSource’协议
 这个数据资源不能被保留
 *******************/
@property (nonatomic, assign) id<CalendarMonthViewDataSource> dataSource;

/*******************
 日历时间网格
 *******************/
@property (nonatomic, strong) NSTimeZone *timeZone;

/*******************
 @return NSDate设置现在选择的年月日
 *******************/
- (NSDate *) dateSelected;

/*******************
 @return NSDate设置当前月网格的年月日
 *******************/
- (NSDate *) monthDate;

/*******************
 @param date 这个日期将被凸显
 *******************/
- (BOOL) selectDate:(NSDate *)date;

/*******************
 重载当前月网格
 *******************/
- (void) reloadData;

/*******************
 @param next YES是下一个月 NO是前一个月
 *******************/
- (void) animateToNextOrPreviousMonth:(BOOL)next;

@end

#pragma mark - CalendarMonthViewDelegate
/*******************
 ‘CalendarMonthView’代理对象必须采用‘CalendarMonthViewDelegate‘协议
 *******************/
@protocol CalendarMonthViewDelegate<NSObject>
@optional

/*******************
 ***凸显的日期改变****
 @param monthView 日历月视图
 @param date 凸显的日期
 *******************/
- (void) calendarMonthView:(CalendarMonthView *)monthView didSelectDate:(NSDate *)date;
/*******************
 **日历将改变当前月显示*
 @param monthView 日历月视图
 @param month 月份
 @param animated 驱动标志
 @return YES(月份改变) NO(不变)
 *******************/
- (BOOL) calendarMonthView:(CalendarMonthView *)monthView monthShouldChange:(NSDate *)month animated:(BOOL)animated;

/*******************
 **日历改变当前月显示**
 @param monthView 日历月视图
 @param month 月份
 @param animated 驱动标志
 *******************/
- (void) calendarMonthView:(CalendarMonthView *)monthView monthWillChange:(NSDate *)month animated:(BOOL)animated;

/*******************
 *日历已经改变当前月显示*
 @param monthView 日历月视图
 @param month 月份
 @param animated 驱动标志
 *******************/
- (void) calendarMonthView:(CalendarMonthView *)monthView monthDidChange:(NSDate *)month animated:(BOOL)animated;
@end

#pragma mark - CalendarMonthViewDataSource
@protocol CalendarMonthViewDataSource <NSObject>
/*******************
 数据资源要符合日历月视图
 @param monthView 日历月视图
 @param startDate 第一天
 @param lastDate 最后一天
 @return an array of NSNumber objects corresponding the number of days specified in the start and last day parameters. Each NSNumber variable will give a BOOL value that will be used to display a dot under the day.
 *******************/
- (NSArray*) calendarMonthView:(CalendarMonthView *)monthView marksFromDate:(NSDate *)startDate toDate:(NSDate *)lastDate;
@end
