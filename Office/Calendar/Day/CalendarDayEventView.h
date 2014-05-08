//
//  CalendarDayEventView.h
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CalendarDayEventView : UIView

/***************
 @return Returns `CalendarDayEventView` object.
 ***************/
+ (CalendarDayEventView*) eventView;

+ (CalendarDayEventView*) eventViewWithIdentifier:(NSNumber *)identifier startDate:(NSDate *)startDate endDate:(NSDate *)endDate title:(NSString *)title location:(NSString *)location;

/** The identifier for the event. */
@property (nonatomic,strong) NSNumber *identifier;

/** The start date for the event. */
@property (nonatomic,strong) NSDate *startDate;

/** The end date for the event. */
@property (nonatomic,strong) NSDate *endDate;

/** The title label for the event. */
@property (nonatomic,strong) UILabel *titleLabel;

/** The location label for the event. */
@property (nonatomic,strong) UILabel *locationLabel;

@property (nonatomic,strong) UIView *edgeView;

- (CGFloat) contentHeight;

@end
