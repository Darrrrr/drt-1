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
        self.detailDescriptionLabel.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"predocontent"]];
        self.detailTime.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"predodate"]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

