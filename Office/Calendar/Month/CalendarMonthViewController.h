//
//  CalendarMonthViewController.h
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarMonthView.h"

@class CalendarMonthView;
@protocol CalendarMonthViewDelegate,CalendarMonthViewDataSource;

@interface CalendarMonthViewController : UIViewController <CalendarMonthViewDelegate,CalendarMonthViewDataSource>
/********************
 @return A newly create month view controller.
 ********************/
- (id) init;

/********************
 @param sundayFirst If YES, Sunday will be the left most day in the month grid, otherwise Monday.
 @return A newly create month view controller.
 ********************/
- (id) initWithSunday:(BOOL)sundayFirst;

/********************
 @param timeZone The time zone for the calendar grid.
 @param sundayFirst If YES, Sunday will be the left most day in the month grid, otherwise Monday.
 @return A newly create month view controller.
 ********************/
- (id) initWithSunday:(BOOL)sundayFirst timeZone:(NSTimeZone*)timeZone;

/********************
 @param timeZone The time zone for the calendar grid.
 @return A newly create month view controller.
 ********************/
- (id) initWithTimeZone:(NSTimeZone *)timeZone;

/********************
 Returns the month view managed by the controller object.
 ********************/
@property (nonatomic,strong) CalendarMonthView *monthView;

@end
