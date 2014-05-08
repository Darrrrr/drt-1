//
//  Global.m
//  Office
//
//  Created by 东华创元 on 14-5-7.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "Global.h"

@implementation Global

+ (NSString*) fullBundlePath:(NSString*)bundlePath{
//    NSLog(@"bundle-====>%@",[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:bundlePath]);
	return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:bundlePath];
}

@end
