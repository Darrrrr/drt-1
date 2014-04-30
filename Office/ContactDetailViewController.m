//
//  ContactDetailViewController.m
//  Office
//
//  Created by 东华创元 on 14-4-29.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "ContactDetailViewController.h"

@interface ContactDetailViewController ()
- (void)configureView;
@end

@implementation ContactDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
        self.name.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"name"]];
        self.telephone.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"telephone"]];
        self.email.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"email"]];
        self.address.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"address"]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"textbg.png"] ];

    
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//打电话
- (IBAction)_telephone:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",[_detailItem objectForKey:@"telephone"]]];
    [[UIApplication sharedApplication] openURL:url];
    NSLog(@"telephone%hhd",[[UIApplication sharedApplication] openURL:url]);
}
//发邮件
- (IBAction)sendEmail:(id)sender {
//    第一种实现方法
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
//    mc.mailComposeDelegate = self;
    NSString *email = [_detailItem objectForKey:@"email"];
    NSLog(@"%@",email);
    [mc setToRecipients:[NSArray arrayWithObjects:email, nil]];
    [mc setSubject:@""];
    [self presentViewController:mc animated:YES completion:nil];
    
    
    for (UIView *view in [mc.view subviews])
    {
        NSLog(@"444444");
        if ([view isKindOfClass:[UINavigationBar class]])
        {
            NSLog(@"333333");
            UINavigationBar *naviBar = (UINavigationBar *)view;
            for (UIView *view in [naviBar subviews])
            {
                NSLog(@"22222");
                if ([view isKindOfClass:[UIButton class]])
                {
                    NSLog(@"11111");
                    UIButton *btn = (UIButton *)view;
                    [btn setBackgroundColor:[UIColor brownColor]];
                    [btn setBackgroundImage:nil forState:UIControlStateNormal];
                    [btn setBackgroundImage:nil forState:UIControlStateDisabled];
                }
            }
        }
    }
//    第二种
//    NSString *tittle = [_detailItem objectForKey:@"email"];
//    NSString *stringURL = [NSString stringWithFormat:@"mailto://%@",tittle];
//    NSURL *url = [NSURL URLWithString:stringURL];
//    [[UIApplication sharedApplication] openURL:url];
}
//谷歌地图查看位置
- (IBAction)address:(id)sender {
    NSString *tittle = [_detailItem objectForKey:@"address"];
    NSString *stringURL = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@",tittle];
    NSURL *url = [NSURL URLWithString:stringURL];
    [[UIApplication sharedApplication] openURL:url];
     NSLog(@"address%hhd",[[UIApplication sharedApplication] openURL:url]);
}
//发短信
- (IBAction)sendMSG:(id)sender {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"sms:+%@",[_detailItem objectForKey:@"telephone"]]];
    [[UIApplication sharedApplication] openURL:url];

    NSLog(@"%@",url);
    [[UIApplication sharedApplication] openURL:url];
    NSLog(@"%hhd",[[UIApplication sharedApplication] openURL:url]);
}
@end
