//
//  UIView + Category.h
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (Category)

/****************
 @param view 视图被加载
 ****************/
- (void) addSubviewToBack:(UIView *)view;

/****************
 视图坐标框架轮到最近的整数
 ****************/
- (void) roundOffFrame;

@end
