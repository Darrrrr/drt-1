//
//  PretodoViewController.m
//  Office
//
//  Created by Darrrrr on 14-4-28.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "PretodoViewController.h"
#import "DetailViewController.h"
#import "Predo.h"
#define preDateTag 1
#define preDoTag 2

@interface PretodoViewController (){

 
    
}

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
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
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

- (void)insertNewObject:(id)sender
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
    [_preDate setText:[NSString stringWithFormat:@"时间：%@",[predoDic objectForKey:@"predodate"]]];
    [_preDo setText:[NSString stringWithFormat:@"%@",[predoDic objectForKey:@"predocontent"]]];
    
    
    
   
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [array removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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
