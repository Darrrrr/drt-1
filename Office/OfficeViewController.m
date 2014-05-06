//
//  OfficeViewController.m
//  Office
//
//  Created by 东华创元 on 14-4-21.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//
#import "OfficeViewController.h"
#import "BDKNotifyHUD.h"
@interface OfficeViewController ()

@property (strong, nonatomic) BDKNotifyHUD *notify;

@end

@implementation OfficeViewController
@synthesize username,password,logo;
- (void)viewDidLoad
{
    
    [UIView beginAnimations:nil context:UIGraphicsGetCurrentContext()];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut]; //InOut 表示进入和出去时都启动动画
    [UIView setAnimationDuration:0.5f];//动画时
    logo.transform=CGAffineTransformMakeScale(0.6f, 0.6f);//先让要显示的view最小直至消失
    //logo.transform=CGAffineTransformMakeScale(0.8f, 0.8f);
    [UIView commitAnimations];
    [super viewDidLoad];
    
    //读取本地用户信息
    NSUserDefaults *local = [NSUserDefaults standardUserDefaults];
    username.text = [local objectForKey:@"UserName"];
    password.text = [local objectForKey:@"Password"];
    
    NSLog(@"9999999999999999%@",[local objectForKey:@"userID"]);
    
}



//保存用户信息
- (void)saveUserNameAndPwd:(NSString *)userName andPwd:(NSString *)pwd withID:(NSString *)userID
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings removeObjectForKey:@"UserName"];
    [settings removeObjectForKey:@"Password"];
    [settings removeObjectForKey:@"UserID"];
    [settings setObject:userName forKey:@"UserName"];
    [settings setObject:pwd forKey:@"Password"];
    [settings setObject:userID forKey:@"userID"];
    [settings synchronize];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doLogin:(id)sender
{
    
    _username = username.text;
    _password = password.text;
    
    UserManager *usermanager = [[UserManager alloc] init];
    int user_id = [usermanager checkUsername:_username andcheckPassword:_password];
    NSLog(@"user_id================>%d",user_id);
    if (user_id) {
        NSLog(@"登陆成功");
        
        //保存用户名和密码
        [self saveUserNameAndPwd:_username andPwd:_password withID:[NSString stringWithFormat:@"%d",user_id]];
        
        
        
        [self performSegueWithIdentifier:@"loginSegue" sender:sender];
    }
    else
    {
        username.text = @"";
        password.text = @"";
        NSLog(@"登陆失败");
        
        
        _notify = [BDKNotifyHUD notifyHUDWithImage:[UIImage imageNamed:@"Checkmark.png"] text:@"  用户名或密码错误  "];
        _notify.center = CGPointMake(self.view.center.x, self.view.center.y - 20);
        
        if (self.notify.isAnimating) return;
        
        [self.view addSubview:self.notify];
        [self.notify presentWithDuration:1.0f speed:0.5f inView:self.view completion:^{
            [self.notify removeFromSuperview];
        }];
        

    }
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


//键盘自动调整位置

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}

//当用户按下return键或者按回车键，keyboard消失
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    UITextField *tf = textField;
    if (tf.tag == 1) {
        [password becomeFirstResponder];
    }
    else{
        [password resignFirstResponder];
    }
    return YES;
}

//输入框编辑完成以后，将视图恢复到原始状态
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}




@end
