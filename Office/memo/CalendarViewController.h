//
//  CalendarViewController.h
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarMonthViewController.h"
#import "CalendarMonthTableViewController.h"
#import "CalendarMonthView.h"
#import "CalendarDayViewController.h"

@interface CalendarViewController : CalendarMonthTableViewController

@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableDictionary *dataDictionary;

- (void) generateRandomDataForStartDate:(NSDate*)start endDate:(NSDate*)end;

@end
