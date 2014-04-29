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

@interface PretodoViewController ()

@end

@implementation PretodoViewController
@synthesize table;
@synthesize array;


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
    
    array = [Predo findAllPredo];
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
    [_preDate setText:[NSString stringWithFormat:@"截止时间：%@",[predoDic objectForKey:@"predodate"]]];
    [_preDo setText:[NSString stringWithFormat:@"%@",[predoDic objectForKey:@"predocontent"]]];
    [_prestate setText:[NSString stringWithFormat:@"%@",[predoDic objectForKey:@"predostate"]]];
    
    
    
   
    return cell;
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
