//
//  MessageViewController.m
//  Office
//
//  Created by 东华创元 on 14-4-29.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "MessageViewController.h"
#import "Message.h"
#import "MsgDetailViewController.h"
#import "MessageAlertView.h"
#import "UserManager.h"
#import "BDKNotifyHUD.h"
#define messageFromTag 1
#define messageDateTag 2
#define messageContentTag 3
#define messageStateTag 4
#define messageidTag 5

@interface MessageViewController ()

@property (strong, nonatomic) BDKNotifyHUD *notify;

@end

@implementation MessageViewController

@synthesize array,userID;


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //设置badge
   // self.navigationController.tabBarItem.badgeValue = [Message messageCount];
    
    NSUserDefaults *local = [NSUserDefaults standardUserDefaults];
    NSString *ID = [local objectForKey:@"UserID"];
    
    userID = [ID intValue] ;
    
    array = [Message findAllMessage:userID];
   
    NSLog(@"PredoViewController.h++++array++%@",array);
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
         NSLog(@"bf%@",array);
                [array removeObjectAtIndex:indexPath.row];
        
         UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        [Message deleteMessage: [[(UILabel *)[cell.contentView viewWithTag:messageidTag] text] intValue]];
        
        
        
         NSLog(@"af%@",array);
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
         self.navigationController.tabBarItem.badgeValue = [Message messageCount];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
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
    static NSString *CellIdentifier = @"Cell1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *msgDic = [array objectAtIndex:[indexPath row]];
    
    UILabel *_messageFrom = (UILabel *)[cell.contentView viewWithTag:messageFromTag];
    UILabel *_messageDate = (UILabel *)[cell.contentView viewWithTag:messageDateTag];
    UILabel *_messageContent = (UILabel *)[cell.contentView viewWithTag:messageContentTag];
    UILabel *_messageId = (UILabel *)[cell.contentView viewWithTag:messageidTag];
   
    
    //消息状态的显示
    // UILabel *_messageState = (UILabel *)[cell.contentView viewWithTag:messageStateTag];
    
    [_messageFrom setText:[NSString stringWithFormat:@"%@",[msgDic objectForKey:@"messagefrom"]]];
    [_messageDate setText:[NSString stringWithFormat:@"%@",[msgDic objectForKey:@"messagedate"]]];
    [_messageContent setText:[NSString stringWithFormat:@"%@",[msgDic objectForKey:@"messagecontent"]]];
    //[_messageState setText:[NSString stringWithFormat:@"%@",[msgDic objectForKey:@"messagestate"]]];
    [_messageId setText:[NSString stringWithFormat:@"%@",[msgDic objectForKey:@"messageid"]]];
    
    //test
    if([[NSString stringWithFormat:@"%@",[msgDic objectForKey:@"messagestate"]] isEqualToString:@"未完成"]){
        cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
        NSLog(@"取消高亮");
    }
    
    NSLog(@"MESSAGE CELL");
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([[segue identifier] isEqualToString:@"showMsg"]) {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSDictionary *msgDic = [array objectAtIndex:[indexPath row]];
    
        if ([[NSString stringWithFormat:@"%@",[msgDic objectForKey:@"messagestate"]] isEqualToString:@"未完成"]) {
             UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        [Message changeState:[[(UILabel *)[cell.contentView viewWithTag:messageidTag] text] intValue]];
        
        array = [Message findAllMessage:userID];
               
        NSLog(@"CELL CHANGE %@ ---------%@ ",[NSArray arrayWithObject:[NSIndexPath indexPathForRow:[indexPath row]inSection:0] ],indexPath);
        
      // [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil]withRowAnimation:UITableViewRowAnimationAutomatic];
        
            cell.backgroundColor = [UIColor whiteColor];
        
        self.navigationController.tabBarItem.badgeValue = [Message messageCount];

        }
        
           
        [[segue destinationViewController] setDetailItem:msgDic];
    }
}


- (IBAction)addMessage:(id)sender {
    //系统自带的AlertView
    //    UIAlertView *alertView1 = [[UIAlertView alloc] initWithTitle:@"Enter Form Name" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    //    alertView1.alertViewStyle = UIAlertViewStyleSecureTextInput;
    //    UITextField *myTextField = [alertView1 textFieldAtIndex:0];
    //    [alertView1 setTag:555];
    //    myTextField.keyboardType=UIKeyboardTypeAlphabet;
    //
    //    [alertView1 show];
    
    //自定义View
    
    MessageAlertView *alertView = [MessageAlertView alertWithTitle:@"" message:@""];
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects: @"发送消息", @"关闭", nil]];
    [alertView setButtonColors:[NSMutableArray arrayWithObjects:[UIColor colorWithRed:255.0f/255.0f green:77.0f/255.0f blue:94.0f/255.0f alpha:1.0f],[UIColor colorWithRed:0.0f green:0.5f blue:1.0f alpha:1.0f],nil]];
    [alertView setDelegate:(id<MessageAlertViewDelegate>)self];
    
    [alertView.dialogView bringSubviewToFront:alertView.containerView];

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

@end
