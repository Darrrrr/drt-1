//
//  CalendarDayView.h
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarDayEventView.h"

@protocol CalendarDayViewDelegate,CalendarDayViewDataSource;
@class TimelineView;
@interface CalendarDayView : UIView<UIScrollViewDelegate>

- (id) initWithFrame:(CGRect)frame calendar:(NSCalendar*)calendar;

- (id) initWithFrame:(CGRect)frame timeZone:(NSTimeZone*)timeZone;


@property (nonatomic,strong) NSCalendar *calendar;




@property (nonatomic,strong) UIView *daysBackgroundView;

/** The date for the current timeline. */
@property (nonatomic,strong) NSDate *date;

/** The delegate must adopt the `CalendarDayViewDelegate` protocol. The data source is not retained. */
@property (nonatomic,assign) id <CalendarDayViewDelegate> delegate;

/** The data source must adopt the `CalendarDayViewDataSource` protocol. The data source is not retained. */
@property (nonatomic,assign) id <CalendarDayViewDataSource> dataSource;

/** The time mark for each hour. Default is NO. */
@property (nonatomic,assign) BOOL is24hClock;

/** The time zone for day view. */
//@property (nonatomic,strong) NSTimeZone *timeZone;

/** Reloads the events. */
- (void) reloadData;

/** Returns an event view that can used by the data source.
 @return A previously used `CalendarDayEventView` object.
 */
- (CalendarDayEventView*) dequeueReusableEventView;


@end

#pragma mark - CalendarDayViewDelegate
/** The delegate of a `CalendarDayView` object must adopt the `CalendarDayViewDelegate` protocol. */
@protocol CalendarDayViewDelegate <NSObject>


@optional
/** The event view that was selected.
 @param calendarDay The calendar day view.
 @param eventView The `CalendarDayEventView` that was selected.
 */
- (void) calendarDayTimelineView:(CalendarDayView*)calendarDay eventViewWasSelected:(CalendarDayEventView *)eventView;

/** The date of the timeline that was brought to focus.
 @param calendarDay The calendar day view.
 @param date The `NSDate` object of the day timeline that was brought to focus.
 */
- (void) calendarDayTimelineView:(CalendarDayView*)calendarDay didMoveToDate:(NSDate*)date;

@end

#pragma mark - CalendarDayViewDataSource
/** The data source of a `CalendarDayView` object must adopt the `CalendarDayViewDataSource` protocol. */
@protocol CalendarDayViewDataSource <NSObject>

@required
/** A data source that will request event views for particular dates.
 @param calendarDay The calendar day view.
 @param date The date of the events that should be returned.
 @return Returns an array of `CalendarDayEventView` objects.
 */
- (NSArray *) calendarDayTimelineView:(CalendarDayView*)calendarDay eventsForDate:(NSDate *)date;

@end
