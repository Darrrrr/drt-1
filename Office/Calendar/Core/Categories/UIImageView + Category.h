//
//  UIImageView + Category.h
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Category)
/******************
 @param imageName The name of the image to create the imagename with.
 @return Returns `UIImageView` object.
 ******************/
+ (UIImageView*) imageViewWithImageNamed:(NSString*)imageName;

/******************
 @param frame The frame of the view.
 @return Returns `UIImageView` object.
 ******************/
+ (UIImageView*) imageViewWithFrame:(CGRect)frame;

@end
