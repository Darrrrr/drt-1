//
//  MsgDetailViewController.m
//  Office
//
//  Created by 东华创元 on 14-4-29.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "MsgDetailViewController.h"

@interface MsgDetailViewController ()
- (void)configureView;
@end

@implementation MsgDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.detailmsgfrom.text = [NSString stringWithFormat:@"  %@",[_detailItem objectForKey:@"messagefrom"]];
        self.detailTime.text = [NSString stringWithFormat:@"  %@",[_detailItem objectForKey:@"messagedate"]];
        
        self.detailmsgcount.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"messagecontent"]];
      
        
        
        NSLog(@"%@,%@,%@",[NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"messagefrom"]],[NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"messagedate"]],[NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"messagecontent"]]);
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"textbg.png"] ];
 
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
