//
//  GradientView.h
//  Office
//
//  Created by 东华创元 on 14-5-7.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GradientView : UIView
/*************
 一个'UIColor'数组对象定义阶梯颜色
 *************/
@property (nonatomic, strong) NSArray *colors;

/*************
 一个可选择的'NSNumber'数组对象定义阶梯位置
 *************/
@property (nonatomic, strong) NSArray *locations;

/*************
 开始点所对应的梯度的第一站。这一点在单元坐标空间的定义，然后映射到层边界的矩形绘制时。
 默认值(0.5,0.0)
 *************/
@property (nonatomic, assign) CGPoint startPoint;

/*************
 结束点的梯度，得出在层的坐标空间。
 *************/
@property (nonatomic, assign) CGPoint endPoint;

/*************
 梯度层绘制的风格
 *************/
@property (nonatomic, copy) NSString *type;

@end
