//
//  OfficeAppDelegate.m
//  Office
//
//  Created by 东华创元 on 14-4-21.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "OfficeAppDelegate.h"
#import "DBManager.h"

@implementation OfficeAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //dispatch_async开启一个异步操作，第一个参数是指定一个gcd队列，第二个参数是分配一个处理事物的程序块到该队列。
    //dispatch_get_global_queue(0, 0)，指用了全局队列。
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        DBManager *manager = [[DBManager alloc] init];
        [DBManager createDataBase];
        if ([manager createTable]) {
            NSLog(@"创建数据库成功");
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
        
    });
   
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
