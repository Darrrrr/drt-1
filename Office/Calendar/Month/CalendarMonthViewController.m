//
//  CalendarMonthViewController.m
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "CalendarMonthViewController.h"
#import "CalendarMonthView.h"

@interface CalendarMonthViewController ()
@property (nonatomic,strong) NSTimeZone *timeZone;
@property (nonatomic,assign) BOOL sundayFirst;
@end

@implementation CalendarMonthViewController

- (id) init{
	self = [self initWithSunday:YES];
	return self;
}
- (id) initWithSunday:(BOOL)sundayFirst{
	self = [self initWithSunday:sundayFirst timeZone:[NSTimeZone defaultTimeZone]];
	return self;
}
- (id) initWithTimeZone:(NSTimeZone *)timeZone{
	self = [self initWithSunday:YES timeZone:self.timeZone];
	return self;
}
- (id) initWithSunday:(BOOL)sundayFirst timeZone:(NSTimeZone *)timeZone{
	if(!(self = [super init])) return nil;
	self.timeZone = timeZone;
	self.sundayFirst = sundayFirst;
	return self;
}
- (id) initWithCoder:(NSCoder *)decoder {
    if(!(self=[super initWithCoder:decoder])) return nil;
	self.timeZone = [NSTimeZone defaultTimeZone];
	self.sundayFirst = YES;
    return self;
}


- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return NO;
}
- (void) viewDidUnload {
	self.monthView = nil;
}

- (void) loadView{
	[super loadView];
	self.view.backgroundColor = [UIColor whiteColor];
	
	if([self respondsToSelector:@selector(edgesForExtendedLayout)])
		self.edgesForExtendedLayout = UIRectEdgeNone;
	
	self.monthView = [[CalendarMonthView alloc] initWithSundayAsFirst:self.sundayFirst timeZone:self.timeZone];
	self.monthView.dataSource = self;
	self.monthView.delegate = self;
	[self.view addSubview:self.monthView];
}

- (NSArray*) calendarMonthView:(CalendarMonthView*)monthView marksFromDate:(NSDate*)startDate toDate:(NSDate*)lastDate{
	return nil;
}

@end
