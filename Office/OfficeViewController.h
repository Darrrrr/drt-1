//
//  OfficeViewController.h
//  Office
//
//  Created by 东华创元 on 14-4-21.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "UserManager.h"

@interface OfficeViewController : UIViewController
{
    NSString *_username;
    NSString *_password;
}
- (IBAction)doLogin:(id)sender;
@property (retain, nonatomic) IBOutlet UITextField *password;
@property (retain, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@end
