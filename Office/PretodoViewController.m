//
//  PretodoViewController.m
//  Office
//
//  Created by Darrrrr on 14-4-28.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "PretodoViewController.h"
#import "PreDetailViewController.h"
#import "Predo.h"
#define preDateTag 1
#define preDoTag 2
#define preDoStateTag 3
#define preSwitch 4
#define preid 5

@interface PretodoViewController ()

@end

@implementation PretodoViewController

@synthesize array,userID,table;



- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    UIBarButtonItem *freshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(freshList:)];
    self.navigationItem.rightBarButtonItem = freshButton;
    
    NSUserDefaults *local = [NSUserDefaults standardUserDefaults];
    NSString *ID = [local objectForKey:@"userID"];
    
    userID = [ID intValue] ;
   
    array = [Predo findAllPredo:userID];
    NSLog(@"PredoViewController.h++++array++%@",array);
    [table setDelegate:self];
    [table setDataSource:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)freshList:(id)sender
{
    array = [Predo findAllPredo:userID];
    [table setDelegate:self];
    [table setDataSource:self];

    
    [table reloadData];
   
    NSLog(@"fresh");

}

#pragma mark - Table View

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *predoDic = [array objectAtIndex:[indexPath row]];
    
    UILabel *_preDate = (UILabel *)[cell.contentView viewWithTag:preDateTag];
    UILabel *_preDo = (UILabel *)[cell.contentView viewWithTag:preDoTag];
    UILabel *_prestate = (UILabel *)[cell.contentView viewWithTag:preDoStateTag];
    //switch
    UISwitch *_preSwitch = (UISwitch *)[cell.contentView viewWithTag:preSwitch];
    UILabel *_preid = (UILabel *)[cell.contentView viewWithTag:preid];
    
    
    
    NSString *ss=[predoDic objectForKey:@"predostate"];
    if([ss isEqual:@"完成"]){
      [_preSwitch setOn:YES ];
    
    }else
    {[_preSwitch setOn:NO ];}
    [_preSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];

    [_preDate setText:[NSString stringWithFormat:@"截止时间：%@",[predoDic objectForKey:@"predodate"]]];
    [_preDo setText:[NSString stringWithFormat:@"%@",[predoDic objectForKey:@"predocontent"]]];
    [_prestate setText:[NSString stringWithFormat:@"%@",[predoDic objectForKey:@"predostate"]]];
    [_preid setText:[NSString stringWithFormat:@"%@",[predoDic objectForKey:@"predoid"]]];
    
    
    
   
    return cell;
}


-(void)switchAction:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
     UITableViewCell *cell = (UITableViewCell *)[[[sender superview] superview] superview];     if (!isButtonOn) {
         
        NSLog(@"switch on foundb = %d", [table indexPathForCell:cell].row);
       
        //修改数据库

        [Predo upDateStatus:[[(UILabel *)[cell.contentView viewWithTag:preid] text] intValue]fromStatus:isButtonOn];
        
    }else {
        
               
        NSLog(@"switch off foundb = %d", [table indexPathForCell:cell].row);
        //修改数据库

        [Predo upDateStatus:[[(UILabel *)[cell.contentView viewWithTag:preid] text] intValue] fromStatus:isButtonOn];
        
      
           }
    [self performSelector:@selector(reloadcell:) withObject:cell afterDelay:0.3f];
    
    
}

- (void)reloadcell:(UITableViewCell *)cell
{
    array = [Predo findAllPredo:userID];
 
    [table reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:[table indexPathForCell:cell].row inSection:0] ]withRowAnimation:UITableViewRowAnimationAutomatic];
        NSLog(@"execute");
}



/*自定义返回
- (void)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // 下一个界面的返回按钮
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title = @"返回";
        temporaryBarButtonItem.target = self;
        temporaryBarButtonItem.action = @selector(back:);
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    }
    NSLog(@"22222222233333333--------------------------------");
    return self;
}

*/



/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *predoDic = [array objectAtIndex:[indexPath row]];
        [[segue destinationViewController] setDetailItem:predoDic];
    }
}

@end
