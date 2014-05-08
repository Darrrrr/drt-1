//
//  CalendarMonthTableViewController.m
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "CalendarMonthTableViewController.h"
#import "NSDate + Category.h"

@interface CalendarMonthTableViewController ()

@end

@implementation CalendarMonthTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.backgroundColor = [UIColor whiteColor];
	
	float y,height;
	y = CGRectGetMaxY(self.monthView.frame);
	height = CGRectGetHeight(self.view.frame) - y;
    
	
	_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, y, CGRectGetWidth(self.view.bounds), height) style:UITableViewStylePlain];
	_tableView.delegate = self;
	_tableView.dataSource = self;
	_tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:_tableView];
	[self.view sendSubviewToBack:_tableView];
}

#pragma mark TableView Delegate & Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
	
    return cell;
}

#pragma mark Month View Delegate & Data Source
- (void) calendarMonthView:(CalendarMonthView*)monthView didSelectDate:(NSDate*)d{
}
- (void) calendarMonthView:(CalendarMonthView*)monthView monthDidChange:(NSDate*)month animated:(BOOL)animated{
	[self updateTableOffset:animated];
}

- (void) updateTableOffset:(BOOL)animated{
	
	
	if(animated){
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.4];
		[UIView setAnimationDelay:0.1];
	}
    
	
	CGFloat y = CGRectGetMaxY(self.monthView.frame);
	self.tableView.frame = CGRectMake(CGRectGetMinX(self.tableView.frame), y, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(self.view.frame) - y);
	
	if(animated) [UIView commitAnimations];
}
@end
