//
//  MessageAlertView.h
//  Office
//
//  Created by Darrrrr on 14-5-4.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MessageAlertViewDelegate

- (void)MessagedialogButtonTouchUpInside:(id)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;


@end


@interface MessageAlertView : UIView<MessageAlertViewDelegate>


@property (nonatomic, retain) UIView *parentView;    // The parent view this 'dialog' is attached to
@property (nonatomic, retain) UIView *dialogView;    // Dialog's container view
@property (nonatomic, retain) UIView *containerView; // Container within the dialog (place your ui elements               here)
@property (nonatomic, retain) UIView *buttonView;    // Buttons on the bottom of the dialog




@property (nonatomic, assign) id<MessageAlertViewDelegate> delegate;
@property (nonatomic, retain) NSArray *buttonColors;
@property (nonatomic, retain) NSArray *buttonTitles;
@property (nonatomic, assign) BOOL useMotionEffects;

@property (copy) void (^onButtonTouchUpInside)(MessageAlertView *alertView, int buttonIndex) ;

- (id)initWithParentView: (UIView *)_parentView;
- (id)init;

- (void)show;
- (void)close;


- (IBAction)MessagedialogButtonTouchUpInside:(id)sender;

- (void)setOnButtonTouchUpInside:(void (^)(MessageAlertView *alertView, int buttonIndex))onButtonTouchUpInside;

+ (MessageAlertView *) alertWithTitle:(NSString *)title message:(NSString *)message;


@end

