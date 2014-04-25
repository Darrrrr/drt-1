//
//  PredoViewController.h
//  Office
//
//  Created by 东华创元 on 14-4-25.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PredoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) NSArray *array;
@end
