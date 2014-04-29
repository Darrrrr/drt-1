//
//  MessageViewController.m
//  Office
//
//  Created by 东华创元 on 14-4-29.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "MessageViewController.h"
#import "Message.h"
#define messageFromTag 1
#define messageDateTag 2
#define messageContentTag 3
#define messageStateTag 4

@interface MessageViewController ()

@end

@implementation MessageViewController
@synthesize table;
@synthesize array;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    array = [Message findAllMessage];
    NSLog(@"PredoViewController.h++++array++%@",array);
    [table setDelegate:self];
    [table setDataSource:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *predoDic = [array objectAtIndex:[indexPath row]];
    
    UILabel *_messageFrom = (UILabel *)[cell.contentView viewWithTag:messageFromTag];
    UILabel *_messageDate = (UILabel *)[cell.contentView viewWithTag:messageDateTag];
    UILabel *_messageContent = (UILabel *)[cell.contentView viewWithTag:messageContentTag];
    UILabel *_messageState = (UILabel *)[cell.contentView viewWithTag:messageStateTag];
    //NSDictionary *dic = @{@"messagecontent": [rs stringForColumn:@"messagecontent"],@"messagedate":[rs stringForColumn:@"messagedate"],@"messagefrom": [rs stringForColumn:@"messagefrom"],@"messagestate": [rs stringForColumn:@"state"]};
    [_messageFrom setText:[NSString stringWithFormat:@"截止时间：%@",[predoDic objectForKey:@"messagefrom"]]];
    [_messageDate setText:[NSString stringWithFormat:@"%@",[predoDic objectForKey:@"messagedate"]]];
    [_messageContent setText:[NSString stringWithFormat:@"%@",[predoDic objectForKey:@"messagecontent"]]];
    [_messageState setText:[NSString stringWithFormat:@"%@",[predoDic objectForKey:@"state"]]];
    
    return cell;
}



@end
