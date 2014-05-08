//
//  CalendarDayViewController.h
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarDayView.h"

@interface CalendarDayViewController : UIViewController <CalendarDayViewDelegate,CalendarDayViewDataSource>

/**********************
 Returns the day view managed by the controller object.
 **********************/
@property (nonatomic,strong) CalendarDayView *dayView;

@end
