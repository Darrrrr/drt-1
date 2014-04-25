//
//  PredoViewController.m
//  Office
//
//  Created by 东华创元 on 14-4-25.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "PredoViewController.h"
#import "Predo.h"
#define preDateTag 1
#define preDoTag 2

@interface PredoViewController ()

@end

@implementation PredoViewController
@synthesize table;
@synthesize array;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}
- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"PredoViewController____viewDidAppear_____执行");
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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

    //加上sections的编号
- (int)numberOfSectionsInTableView:(UITableView *)tableView{
    //set the number of sections inside the tableview.we need only one section
    return 1;
}
    //设置序列的总数。总数和_sampleDataArray序列中的全部对象数相同
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //the number of rows is equal to the number of the sample data in our tableview
    return [array count];
}
    //设置每列的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //set the row heigh
    return 45.0;
}
    
    
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *predoDic = [array objectAtIndex:[indexPath row]];
    UIFont *font1 = [UIFont fontWithName:@"Arial" size:10.0f];
    UIFont *font2 = [UIFont fontWithName:@"Arial" size:20.0f];
    static NSString *CellID = @"Cell";
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        //待办时间
        UILabel *preDate = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 100, 30)];
        preDate.tag = preDateTag;
        [cell.contentView addSubview:preDate];
        UILabel *preDo = [[UILabel alloc] initWithFrame:CGRectMake(110, 20, 100, 30)];
        preDo.tag = preDoTag;
        [cell.contentView addSubview:preDo];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UILabel *_preDate = (UILabel *)[cell.contentView viewWithTag:preDateTag];
    UILabel *_preDo = (UILabel *)[cell.contentView viewWithTag:preDoTag];
    [_preDate setFont:font1];
    [_preDo setFont:font2];
    [_preDate setText:[NSString stringWithFormat:@"时间：%@",[predoDic objectForKey:@"predodate"]]];
    [_preDo setText:[NSString stringWithFormat:@"%@",[predoDic objectForKey:@"predocontent"]]];
    NSLog(@"PREDATE-----%@",_preDate.text);
    //[_preDate setText:[NSString stringWithFormat:@"%@",[medDic objectForKey:@"prDate"]]];
    NSLog(@"++++++++++++++%@",[predoDic objectForKey:@"predocontent"]);
    return cell;
}

@end
