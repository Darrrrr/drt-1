//
//  UIView + Category.m
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "UIView + Category.h"

@implementation UIView (Category)

- (void) addSubviewToBack:(UIView*)view{
	[self insertSubview:view atIndex:0];
}


- (void) roundOffFrame{
	self.frame = CGRectMake(roundf(CGRectGetMinX(self.frame)), roundf(CGRectGetMinY(self.frame)), roundf(CGRectGetWidth(self.frame)), roundf(CGRectGetHeight(self.frame)));
}

@end
