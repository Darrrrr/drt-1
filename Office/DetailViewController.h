//
//  DetailViewController.h
//  Office
//
//  Created by Darrrrr on 14-4-28.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController



@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
