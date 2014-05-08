//
//  CalendarMonthTableViewController.h
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarMonthViewController.h"

@interface CalendarMonthTableViewController : CalendarMonthViewController <UITableViewDelegate, UITableViewDataSource>
/***************
 Returns the table view managed by the controller object.
 ***************/
@property (nonatomic,strong) UITableView *tableView;

/***************
 @param animated Animation flag.
 ***************/
- (void) updateTableOffset:(BOOL)animated;

@end
