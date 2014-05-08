//
//  UIColor + Category.h
//  Office
//
//  Created by 东华创元 on 14-5-7.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(Category)
/*******************
 @param hex 值决定颜色
 @return ‘UIColor’对象
 *******************/
+ (UIColor *) colorWithHex:(unsigned int)hex;

/*******************
 @param hex 值决定颜色
 @param alpha 不透明的颜色
 @return ‘UIColor’对象
 *******************/
+ (UIColor *) colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha;

/*******************
 @return ‘UIColor’对象
 *******************/
+ (UIColor *) randomColor;

@end
