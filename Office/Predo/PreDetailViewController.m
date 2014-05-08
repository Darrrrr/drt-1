//
//  DetailViewController.m
//  Office
//
//  Created by Darrrrr on 14-4-28.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "PreDetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

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

        self.detailTime.text = [NSString stringWithFormat:@"  截止时间%@",[_detailItem objectForKey:@"predodate"]];
        self.detailpredo.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"predodetail"]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
   
    NSString *ss = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"predocontent"]];
    
   //设置背景图片
    
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"textbg.png"] ];
    
    //[self.navigationItem setTitle:[NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"predocontent"]]];
    if (ss.length>= 10) {
        
       [self.navigationItem setTitle:[[ss substringWithRange:NSMakeRange(0, 10)]stringByAppendingString:@"..."]];
        
       }
    
       else
      
       [self.navigationItem setTitle:ss];
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

