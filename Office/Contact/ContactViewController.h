//
//  ContactViewController.h
//  Office
//
//  Created by 东华创元 on 14-4-29.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ContactViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *table;

@property (strong, nonatomic) NSMutableArray *array;

@property (strong, nonatomic) NSMutableDictionary *dic;
@end
