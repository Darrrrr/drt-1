//
//  ContactDetailViewController.h
//  Office
//
//  Created by 东华创元 on 14-4-29.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface ContactDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *telephone;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)_telephone:(id)sender;
- (IBAction)sendEmail:(id)sender;
- (IBAction)address:(id)sender;
- (IBAction)showSMSPicker:(id)sender;

- (IBAction)button:(id)sender;



@end
