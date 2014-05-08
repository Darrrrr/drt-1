//
//  MessageAlertView.m
//  Office
//
//  Created by Darrrrr on 14-5-4.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//
#import "MessageAlertView.h"
#import <QuartzCore/QuartzCore.h>



#define kMessageDefaultButtonColor [UIColor colorWithRed:0.670f green:0.670f blue:0.670f alpha:1.0f]

const static CGFloat kMessageAlertViewDefaultButtonHeight       = 40;
const static CGFloat kMessageAlertViewDefaultButtonSpacerHeight = 10;
const static CGFloat kMessageAlertViewCornerRadius              = 5;
const static CGFloat kMessageMotionEffectExtent                 = 10.0;

@implementation MessageAlertView

CGFloat buttonHeight = 0;
CGFloat buttonSpacerHeight = 0;

@synthesize parentView, containerView, dialogView, buttonView, onButtonTouchUpInside;
@synthesize delegate;
@synthesize buttonTitles;
@synthesize buttonColors;
@synthesize useMotionEffects;

- (id)initWithParentView: (UIView *)_parentView
{
    self = [super init];
    if (self) {
        
        if (_parentView) {
            self.frame = _parentView.frame;
            parentView = _parentView;
        } else {
            self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        }
        
        delegate = self;
        useMotionEffects = false;
        buttonTitles = @[@"Close"];
        buttonColors = @[kMessageDefaultButtonColor];
    }
    return self;
}

- (id)init
{
    return [self initWithParentView:NULL];
}

// Create the dialog view, and animate opening the dialog
- (void)show
{
    dialogView = [self createContainerView];
    
    dialogView.layer.shouldRasterize = YES;
    dialogView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    
   
    
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    
#if (defined(__IPHONE_7_0))
    if (useMotionEffects) {
        [self applyMotionEffects];
    }
#endif
    
    dialogView.layer.opacity = 0.1f;
    dialogView.layer.transform = CATransform3DMakeScale(1.3f, 1.3f, 1.0);
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    [self addSubview:dialogView];
    
    // Can be attached to a view or to the top most window
    // Attached to a view:
    if (parentView != NULL) {
        [parentView addSubview:self];
        
        // Attached to the top most window (make sure we are using the right orientation):
    } else {
        
        [self setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        

       
        
        [[[UIApplication sharedApplication] keyWindow]addSubview:self];
    }
    //背景
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
					 animations:^{
						 self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2f];
                         dialogView.layer.opacity = 1.0f;
                         dialogView.layer.transform = CATransform3DMakeScale(1, 1, 1);
					 }
					 completion:NULL
     ];
}

+ (MessageAlertView *) alertWithTitle:(NSString *)title message:(NSString *)message
{
    MessageAlertView* alertView = [[MessageAlertView alloc] init];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, alertView.bounds.size.width - 40, 100)];
    view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0f];
    
    
    // Add some custom content to the alert view
    UITextView * user = [[UITextView alloc] initWithFrame:CGRectMake(20, 20, view.bounds.size.width - 40, 40)];
    user.backgroundColor =[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.0f];
    
    user.text = title;
    if (  [user.text isEqualToString:@""]) {
        user.text = @"发送至...";
        user.textColor = [UIColor lightGrayColor];
    }
    
   
    user.font = [UIFont systemFontOfSize:18.0f];
    user.textAlignment = NSTextAlignmentLeft;
    user.delegate = (id<UITextViewDelegate>)self;
    user.returnKeyType = UIReturnKeyDefault;
    user.tag=11;
    user.autocapitalizationType = UITextAutocapitalizationTypeNone;
    user.keyboardType =UIKeyboardAppearanceAlert;
    

    
    
    

    
    
    //[user sizeToFit];
    
    CGRect frame = user.frame;
    frame.size.width =  view.bounds.size.width - 40;
    user.frame = frame;
    
    [view addSubview:user];
    
    
 
    
    UITextView *messageLabel = [[UITextView alloc] initWithFrame:CGRectMake(20, user.frame.origin.y + user.frame.size.height + 20, view.bounds.size.width - 40, 300)];
    messageLabel.backgroundColor =[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.0f];
    
    messageLabel.text = message;
    
    if (  [messageLabel.text isEqualToString:@""]) {
        messageLabel.text = @"请输入内容...";
        messageLabel.textColor = [UIColor lightGrayColor];
    }

    
    messageLabel.font = [UIFont systemFontOfSize:18.0f];
    messageLabel.textAlignment = NSTextAlignmentLeft;
    messageLabel.tag=12;
    messageLabel.delegate = (id<UITextViewDelegate>)self;
    
    messageLabel.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
     messageLabel.keyboardType =UIKeyboardAppearanceAlert;
    
    
    
    //[messageLabel sizeToFit];
    messageLabel.returnKeyType = UIReturnKeyDone;
    CGRect frame2 = messageLabel.frame;
    frame2.size.width =  view.bounds.size.width - 40;
    messageLabel.frame = frame2;
    
    [view addSubview:messageLabel];
    
    CGRect frame3 = view.frame;
    frame3.size.height = user.bounds.size.height + messageLabel.bounds.size.height + 30;
    view.frame = frame3;
    
    [alertView setContainerView:view];
    
    [alertView setUseMotionEffects:true];
    
    return alertView;
}

// Button has touched
- (IBAction)MessagedialogButtonTouchUpInside:(id)sender
{
    if (delegate != NULL) {
        [delegate MessagedialogButtonTouchUpInside:self clickedButtonAtIndex:[sender tag]];
    }
    
    if (onButtonTouchUpInside != NULL) {
        onButtonTouchUpInside(self, [sender tag]);
    }
}

// Default button behaviour
- (void)MessagedialogButtonTouchUpInside: (MessageAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self close];
}

// Dialog close animation then cleaning and removing the view from the parent
- (void)close
{
    dialogView.layer.transform = CATransform3DMakeScale(1, 1, 1);
    dialogView.layer.opacity = 1.0f;
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
					 animations:^{
						 self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
                         dialogView.layer.transform = CATransform3DMakeScale(0.6f, 0.6f, 1.0);
                         dialogView.layer.opacity = 0.0f;
					 }
					 completion:^(BOOL finished) {
                         for (UIView *v in [self subviews]) {
                             [v removeFromSuperview];
                         }
                         [self removeFromSuperview];
					 }
	 ];
}

- (void)setSubView: (UIView *)subView
{
    containerView = subView;
}

// Creates the container view here: create the dialog, then add the custom content and buttons
- (UIView *)createContainerView
{
    if ([buttonTitles count] > 0) {
        buttonHeight       = kMessageAlertViewDefaultButtonHeight;
        buttonSpacerHeight = kMessageAlertViewDefaultButtonSpacerHeight;
    } else {
        buttonHeight = 0;
        buttonSpacerHeight = 0;
    }
    
    if (containerView == NULL) {
        containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 150)];
    }
    
    CGFloat dialogWidth = containerView.frame.size.width;
    CGFloat dialogHeight = containerView.frame.size.height + (buttonHeight + buttonSpacerHeight) * [buttonTitles count];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
        CGFloat tmp = screenWidth;
        screenWidth = screenHeight;
        screenHeight = tmp;
    }
    
    // For the black background
    [self setFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    
    // This is the dialog's container; we attach the custom content and the buttons to this one
    UIView *dialogContainer = [[UIView alloc] initWithFrame:CGRectMake((screenWidth - dialogWidth) / 2, (screenHeight - dialogHeight) / 2-5, dialogWidth, dialogHeight)];
    
    // First, we style the dialog to match the iOS7 UIAlertView >>>
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = dialogContainer.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithRed:218.0/255.0 green:218.0/255.0 blue:218.0/255.0 alpha:0.0f] CGColor],
                       (id)[[UIColor colorWithRed:233.0/255.0 green:233.0/255.0 blue:233.0/255.0 alpha:0.0f] CGColor],
                       (id)[[UIColor colorWithRed:218.0/255.0 green:218.0/255.0 blue:218.0/255.0 alpha:0.0f] CGColor],
                       nil];
    
    CGFloat cornerRadius = kMessageAlertViewCornerRadius;
    gradient.cornerRadius = cornerRadius;
    [dialogContainer.layer insertSublayer:gradient atIndex:0];
    dialogContainer.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"msgbg.png"] ];
    dialogContainer.layer.cornerRadius = 1;
    dialogContainer.layer.borderColor = [[UIColor colorWithRed:198.0/255.0 green:198.0/255.0 blue:198.0/255.0 alpha:0.0f] CGColor];
    dialogContainer.layer.borderWidth = 1;
    dialogContainer.layer.shadowRadius = cornerRadius + 5;
    dialogContainer.layer.shadowOpacity = 0.1f;
    dialogContainer.layer.shadowOffset = CGSizeMake(0 - (cornerRadius+5)/2, 0 - (cornerRadius+5)/2);
    dialogContainer.layer.shadowColor = [UIColor blackColor].CGColor;
    dialogContainer.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:dialogContainer.bounds cornerRadius:dialogContainer.layer.cornerRadius].CGPath;
    
    // Add the custom container if there is any
    [dialogContainer addSubview:containerView];
    
    // Add the buttons too
    [self addButtonsToView:dialogContainer];
    
    return dialogContainer;
}

- (void)addButtonsToView: (UIView *)container
{
    for (int i = 0; i < [buttonTitles count]; i++)
    {
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [closeButton setFrame:CGRectMake(0, container.bounds.size.height - ([buttonTitles count] - i) * (buttonHeight + buttonSpacerHeight)-i*2, self.containerView.bounds.size.width, buttonHeight)];
        
        [closeButton addTarget:self action:@selector(MessagedialogButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [closeButton setTag:i];
        [closeButton setTitle:[buttonTitles objectAtIndex:i] forState:UIControlStateNormal];
        
        if([buttonColors count] > i && [buttonColors objectAtIndex:i])
            [closeButton setBackgroundColor:[buttonColors objectAtIndex:i]];
        else [closeButton setBackgroundColor:kMessageDefaultButtonColor];
        
        [closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [closeButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16.0f]];
        [closeButton.layer setCornerRadius:1];
        
        [container addSubview:closeButton];
        
    }
}




#pragma mark - UITextView Delegate Methods

+ (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    NSLog(@"ssssssssshhhhhhhhhh");
    
    UITextView *tf = textView;
    
    if ([text isEqualToString:@"\n"]) {
        [tf resignFirstResponder];
        
        return NO;
        NSLog(@"ssssssssshhhhhhhhhhsssss");
        
    }
    return YES;
    
}


+ (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{

    
    textView.text=@"";
    textView.textColor = [UIColor blackColor];
    return YES;
}



#if (defined(__IPHONE_7_0))
// Add motion effects
- (void)applyMotionEffects {
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        return;
    }
    
    UIInterpolatingMotionEffect *horizontalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                                                    type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalEffect.minimumRelativeValue = @(-kMessageMotionEffectExtent);
    horizontalEffect.maximumRelativeValue = @( kMessageMotionEffectExtent);
    
    UIInterpolatingMotionEffect *verticalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                                                  type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalEffect.minimumRelativeValue = @(-kMessageMotionEffectExtent);
    verticalEffect.maximumRelativeValue = @( kMessageMotionEffectExtent);
    
    UIMotionEffectGroup *motionEffectGroup = [[UIMotionEffectGroup alloc] init];
    motionEffectGroup.motionEffects = @[horizontalEffect, verticalEffect];
    
    [dialogView addMotionEffect:motionEffectGroup];
}
#endif

@end