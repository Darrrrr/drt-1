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
#define messageFromTag 1
#define messageDateTag 2
#define messageContentTag 3
#define messageStateTag 4
#define messageidTag 5

@interface MessageViewController ()

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
    
    NSUserDefaults *local = [NSUserDefaults standardUserDefaults];
    NSString *ID = [local objectForKey:@"userID"];
    
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
   // UILabel *_messageState = (UILabel *)[cell.contentView viewWithTag:messageStateTag];
   
    [_messageFrom setText:[NSString stringWithFormat:@"%@",[msgDic objectForKey:@"messagefrom"]]];
    [_messageDate setText:[NSString stringWithFormat:@"%@",[msgDic objectForKey:@"messagedate"]]];
    [_messageContent setText:[NSString stringWithFormat:@"%@",[msgDic objectForKey:@"messagecontent"]]];
    //[_messageState setText:[NSString stringWithFormat:@"%@",[predoDic objectForKey:@"messagestate"]]];
     [_messageId setText:[NSString stringWithFormat:@"%@",[msgDic objectForKey:@"messageid"]]];
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showMsg"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *msgDic = [array objectAtIndex:[indexPath row]];
        [[segue destinationViewController] setDetailItem:msgDic];
    }
}


- (IBAction)addMessage:(id)sender {

    UIAlertView *alertView1 = [[UIAlertView alloc] initWithTitle:@"Enter Form Name" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    alertView1.alertViewStyle = UIAlertViewStyleSecureTextInput;
    UITextField *myTextField = [alertView1 textFieldAtIndex:0];
    [alertView1 setTag:555];
    myTextField.keyboardType=UIKeyboardTypeAlphabet;
    
    [alertView1 show];

    
    // 添加的测试
    NSUserDefaults *local = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@",[local objectForKey:@"userID"]);
    [Message addMessage:[[local objectForKey:@"userID"] intValue]];
    
}
@end
