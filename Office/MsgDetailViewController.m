//
//  MsgDetailViewController.m
//  Office
//
//  Created by 东华创元 on 14-4-29.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "MsgDetailViewController.h"
#import "MessageAlertView.h"
#import "Message.h"
#import "UserManager.h"
#import "BDKNotifyHUD.h"
@interface MsgDetailViewController ()
- (void)configureView;

@property (strong, nonatomic) BDKNotifyHUD *notify;
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
        self.detailmsgfrom.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"messagefrom"]];
        self.detailTime.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"messagedate"]];
        
        self.detailmsgcount.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"messagecontent"]];
      
        
        
        NSLog(@"%@,%@,%@",[NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"messagefrom"]],[NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"messagedate"]],[NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"messagecontent"]]);
    }
}

- (IBAction)reply:(id)sender{
    
    MessageAlertView *alertView = [MessageAlertView alertWithTitle:self.detailmsgfrom.text message:@""];
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects: @"发送消息", @"关闭", nil]];
    [alertView setButtonColors:[NSMutableArray arrayWithObjects:[UIColor colorWithRed:255.0f/255.0f green:77.0f/255.0f blue:94.0f/255.0f alpha:1.0f],[UIColor colorWithRed:0.0f green:0.5f blue:1.0f alpha:1.0f],nil]];
    [alertView setDelegate:(id<MessageAlertViewDelegate>)self];
    
    [alertView show];
    
    
    
    
    
}

- (void)MessagedialogButtonTouchUpInside: (MessageAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", buttonIndex, [alertView tag]);
    
    
    
    
    if(buttonIndex == 0){
        //获取输入框内容
        UITextView *user =(UITextView *)[alertView viewWithTag:11];
        NSLog(@"%@",user.text) ;
        
        UITextView *message =(UITextView *)[alertView viewWithTag:12];
        NSLog(@"%@",message.text) ;
        //查找用户是否存在
        int id = [UserManager checkUserExist:user.text];
        NSLog(@"%d",id);
        if( id>0 ){
            
            // 添加的测试
            
            if([message.text isEqualToString:@"请输入内容..."]){
                message.text = @"";
            }
            
            [Message addMessage:id withMessage:message.text];
            
            [alertView close];
            
        }else{
           
            _notify = [BDKNotifyHUD notifyHUDWithImage:[UIImage imageNamed:@"Checkmark.png"] text:@" 未找到该用户！"];
            _notify.center = CGPointMake(self.view.center.x, self.view.center.y - 20);
            
            if (self.notify.isAnimating) return;
            
            [alertView addSubview:self.notify];
            [self.notify presentWithDuration:1.0f speed:0.5f inView:self.view completion:^{
                [self.notify removeFromSuperview];
            }];
            

            
                      
        }
        
        
        
    }
    
    else
        [alertView close];
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
