//
//  CalendarDayViewController.m
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "CalendarDayViewController.h"
#import "CalendarDayView.h"
#import "CalendarDayEventView.h"

#pragma mark - CalendarDayViewController
@implementation CalendarDayViewController
#pragma mark View Lifecycle
- (void) loadView{
	[super loadView];
	
	CGRect frame = self.view.frame;
	frame.size.width = 320;
	self.view.frame = frame;
	
	if([self respondsToSelector:@selector(edgesForExtendedLayout)])
		self.edgesForExtendedLayout = UIRectEdgeNone;
	self.dayView = [[CalendarDayView alloc] initWithFrame:self.view.bounds];
	self.dayView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.dayView.delegate = self;
	self.dayView.dataSource = self;
	[self.view addSubview:self.dayView];
}
- (void) viewDidUnload {
	self.dayView = nil;
}

#pragma mark CalendarDayViewDelegate
- (NSArray *) calendarDayTimelineView:(CalendarDayView*)calendarDayTimeline eventsForDate:(NSDate *)eventDate{
	return @[];
}
- (void) calendarDayTimelineView:(CalendarDayView*)calendarDayTimeline eventViewWasSelected:(CalendarDayEventView *)eventView{
    
}

- (void) calendarDayTimelineView:(CalendarDayView*)calendarDayTimeline didMoveToDate:(NSDate*)eventDate{
	
}

@end
