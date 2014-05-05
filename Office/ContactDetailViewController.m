//
//  ContactDetailViewController.m
//  Office
//
//  Created by 东华创元 on 14-4-29.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "ContactDetailViewController.h"
#import "QRCodeGenerator.h"

@interface ContactDetailViewController ()
- (void)configureView;
@end

@implementation ContactDetailViewController
@synthesize imageView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.name.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"name"]];
        self.telephone.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"telephone"]];
        self.email.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"email"]];
        self.address.text = [NSString stringWithFormat:@"%@",[_detailItem objectForKey:@"address"]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"textbg.png"] ];

    
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//打电话
- (IBAction)_telephone:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",[_detailItem objectForKey:@"telephone"]]];
    [[UIApplication sharedApplication] openURL:url];
    NSLog(@"telephone%hhd",[[UIApplication sharedApplication] openURL:url]);
}
//发邮件
- (IBAction)sendEmail:(id)sender {
//    第一种实现方法
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
//    mc.mailComposeDelegate = self;
    NSString *email = [_detailItem objectForKey:@"email"];
    NSLog(@"%@",email);
    [mc setToRecipients:[NSArray arrayWithObjects:email, nil]];
    [mc setSubject:@""];
    [self presentViewController:mc animated:YES completion:nil];
    
    
    for (UIView *view in [mc.view subviews])
    {
        NSLog(@"444444");
        if ([view isKindOfClass:[UINavigationBar class]])
        {
            NSLog(@"333333");
            UINavigationBar *naviBar = (UINavigationBar *)view;
            for (UIView *view in [naviBar subviews])
            {
                NSLog(@"22222");
                if ([view isKindOfClass:[UIButton class]])
                {
                    NSLog(@"11111");
                    UIButton *btn = (UIButton *)view;
                    [btn setBackgroundColor:[UIColor brownColor]];
                    [btn setBackgroundImage:nil forState:UIControlStateNormal];
                    [btn setBackgroundImage:nil forState:UIControlStateDisabled];
                }
            }
        }
    }
//    第二种
//    NSString *tittle = [_detailItem objectForKey:@"email"];
//    NSString *stringURL = [NSString stringWithFormat:@"mailto://%@",tittle];
//    NSURL *url = [NSURL URLWithString:stringURL];
//    [[UIApplication sharedApplication] openURL:url];
}
//谷歌地图查看位置
- (IBAction)address:(id)sender {
    NSString *tittle = [_detailItem objectForKey:@"address"];
    NSString *stringURL = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@",tittle];
    NSURL *url = [NSURL URLWithString:stringURL];
    [[UIApplication sharedApplication] openURL:url];
     NSLog(@"address%hhd",[[UIApplication sharedApplication] openURL:url]);
}




- (IBAction)showSMSPicker:(id)sender{
    Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
    if (messageClass != nil) {
        if ([messageClass canSendText]) {
            [self displaySMSComposerSheet];
        }
        else {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"设备没有短信功能" delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:nil];
            [alert show];
         
        }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"iOS版本过低,iOS4.0以上才支持程序内发送短信" delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:nil];
        [alert show];
       
    }
}

//生成二维码
- (IBAction)button:(id)sender {
    NSError *error;
    NSString *string = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:_detailItem options:NSJSONWritingPrettyPrinted error:&error ] encoding:NSUTF8StringEncoding];
    imageView.image = [QRCodeGenerator qrImageForString:string imageSize:imageView.bounds.size.width];
    NSString *name = [_detailItem  objectForKey:@"name"];
    UIImage *savedImage = [UIImage imageNamed:name];
    [self saveImageToPhotos:savedImage];
}

- (void)displaySMSComposerSheet {
    MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
    picker.messageComposeDelegate = self;
    
   
        NSString *msg = [NSString stringWithFormat:@"string"];
        picker.body = [[NSString alloc] initWithString:msg];
    
    picker.recipients = [_detailItem objectForKey:@"telephone"];
    [self presentModalViewController:picker animated:YES];
    
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    switch (result)
    {
        case MessageComposeResultCancelled:
            //LOG_EXPR(@"Result: SMS sending canceled");
            break;
        case MessageComposeResultSent:
        {        }
            break;
        case MessageComposeResultFailed:
        {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"发送失败" delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:nil];
            [alert show];
           
            
        }
            break;
        default:
            //LOG_EXPR(@"Result: SMS not sent");
            break;
    }
    [self dismissModalViewControllerAnimated:YES];
}

//保存二维码到本地
void UIImageWriteToSavedPhotosAlbum (
                                     UIImage  *image,
                                     id       completionTarget,
                                     SEL      completionSelector,
                                     void     *contextInfo
                                     );
- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保存图片结果提示" message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}
- (void)saveImageToPhotos:(UIImage*)savedImage
{
    UIImageWriteToSavedPhotosAlbum(imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}


@end
