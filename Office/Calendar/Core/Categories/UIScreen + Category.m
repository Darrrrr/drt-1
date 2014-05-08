//
//  UIScreen + Category.m
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "UIScreen + Category.h"

@implementation UIScreen (Category)

- (CGFloat) onePixelSize{
	return 1.0f / self.scale;
}

@end

