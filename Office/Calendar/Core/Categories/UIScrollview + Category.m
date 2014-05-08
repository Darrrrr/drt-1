//
//  UIScrollview + Category.m
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "UIScrollview + Category.h"

@implementation UIScrollView(Category)


- (void) scrollToTop{
	self.contentOffset = CGPointMake( -self.contentInset.left, -self.contentInset.top);
}

@end
