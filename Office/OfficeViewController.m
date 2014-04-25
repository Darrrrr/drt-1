//
//  OfficeViewController.m
//  Office
//
//  Created by 东华创元 on 14-4-21.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//
#import "OfficeViewController.h"

@interface OfficeViewController ()

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
    
    
    
}



//保存用户信息
- (void)saveUserNameAndPwd:(NSString *)userName andPwd:(NSString *)pwd
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings removeObjectForKey:@"UserName"];
    [settings removeObjectForKey:@"Password"];
    [settings setObject:userName forKey:@"UserName"];
    [settings setObject:pwd forKey:@"Password"];
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
    if ([usermanager checkUsername:_username andcheckPassword:_password]) {
        NSLog(@"登陆成功");
        
        //保存用户名和密码
        [self saveUserNameAndPwd:_username andPwd:_password];
        
        
        
        [self performSegueWithIdentifier:@"loginSegue" sender:sender];
    }
    else
    {
        username.text = @"";
        password.text = @"";
        NSLog(@"登陆失败");
        
        UIAlertView *ad;
        ad = [[UIAlertView alloc]initWithTitle:@"提示" message:@"错误的用户名或密码" delegate:self cancelButtonTitle: @"确定"
                             otherButtonTitles:nil, nil];
        ad.alertViewStyle = UIAlertViewStyleDefault;
        [ad show];
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
