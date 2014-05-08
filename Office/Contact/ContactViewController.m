//
//  ContactViewController.m
//  Office
//
//  Created by 东华创元 on 14-4-29.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "ContactViewController.h"
#import "Contact.h"
#import "ContactDetailViewController.h"
#import "pinyin.h"
#define contactNameTag 1
@interface ContactViewController ()

@end

@implementation ContactViewController
@synthesize table;
@synthesize array;
@synthesize dic;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadContacts];
    [table setDelegate:self];
    [table setDataSource:self];
}

-(void)loadContacts
{
    for (int i = 0; i < 26; i++) {
        [dic setObject:[NSMutableArray array] forKey:[NSString stringWithFormat:@"%c",'A'+i]];
    }
    [dic setObject:[NSMutableArray array] forKey:[NSString stringWithFormat:@"%c",'#']];
    array = [Contact findAllContacts];
//array数组按拼音排序
    [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//        NSString *name1 = [[obj1 valueForKey:@"name"] substringToIndex:1];
//        NSString *name2 = [obj2 valueForKey:@"name"];
//        NSLog(@"-------%@,%@",name1,name2);
//        NSLog(@"+++++++%d",[name1 compare:name2]);
//        if ([name1 compare:name2]) {
//            return NSOrderedDescending;
//        }
//        else{
//            return NSOrderedAscending;
//        }
//        return NSOrderedSame;
        char f1 = pinyinFirstLetter([[obj1 valueForKey:@"name"] substringToIndex:1]);
        char f2 = pinyinFirstLetter([[obj2 valueForKey:@"name"] substringToIndex:1]);
        NSLog(@"f1,f2=====>%c,%c",f1,f2);
//        NSString *name1 = [[NSStringstringWithFormat:@"%c",f1] uppercaseString];
//        NSString *name2 = [[NSStringstringWithFormat:@"%c",f2] uppercaseString];
        return 1;
    }];
//    NSString *name = [array valueForKey:@"name"];
//    char first = pinyinFirstLetter([name characterAtIndex:0]);
//    NSString *sectionName;

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell" forIndexPath:indexPath];
    
    NSDictionary *predoDic = [array objectAtIndex:[indexPath row]];
    
    UILabel *_contactName = (UILabel *)[cell.contentView viewWithTag:contactNameTag];
    [_contactName setText:[NSString stringWithFormat:@"%@",[predoDic objectForKey:@"name"]]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
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
