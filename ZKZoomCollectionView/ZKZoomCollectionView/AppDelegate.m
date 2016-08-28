//
//  AppDelegate.m
//  ZKZoomCollectionView
//
//  Created by ZK on 16/8/28.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import "AppDelegate.h"
#import "ZKMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    ZKMainViewController *mainVC = [[ZKMainViewController alloc] init];
    self.window.rootViewController = mainVC;
    
    return YES;
}

@end
