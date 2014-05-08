//
//  MessageViewController.h
//  Office
//
//  Created by 东华创元 on 14-4-29.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UITableViewController

@property (retain, nonatomic) NSMutableArray *array;


@property  (assign,nonatomic) int userID;
- (IBAction)addMessage:(id)sender;

@end
