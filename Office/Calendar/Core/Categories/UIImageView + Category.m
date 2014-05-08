//
//  UIImageView + Category.m
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "UIImageView + Category.h"

@implementation UIImageView (Category)

+ (id) imageViewWithImageNamed:(NSString*)imageName{
	return [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
}

+ (id) imageViewWithFrame:(CGRect)frame{
	return [[UIImageView alloc] initWithFrame:frame];
}

@end
