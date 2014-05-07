//
//  tabbarController.m
//  Office
//
//  Created by Darrrrr on 14-5-7.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "tabbarController.h"
#import "Predo.h"
#import "Message.h"

@interface tabbarController ()

@end

@implementation tabbarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITabBarItem * t1 = (UITabBarItem *)[self.tabBar.items objectAtIndex:0];
   
    t1.badgeValue = [Predo predoCount];
    
    UITabBarItem * t2 = (UITabBarItem *)[self.tabBar.items objectAtIndex:1];
    
    t2.badgeValue = [Message messageCount];

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
