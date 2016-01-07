//
//  AppDelegate.m
//  AutoLayoutPractice
//
//  Created by Xuan on 1/7/16.
//  Copyright © 2016 Wingzero. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
    UIView *myView;
//    UIWindow *falseLaunchScreen;
}

-(void)removeAd {
    [myView removeFromSuperview];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    falseLaunchScreen = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    falseLaunchScreen.windowLevel = UIWindowLevelNormal+1;
////    falseLaunchScreen.hidden = NO;
//    [falseLaunchScreen makeKeyAndVisible];
//    falseLaunchScreen.rootViewController = [UIViewController new];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:falseLaunchScreen.bounds];
//    imageView.image = [UIImage imageNamed:@"Alexstrasza_full"];
//    [falseLaunchScreen addSubview:imageView];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [UIViewController new];
    myView = [[UIView alloc] initWithFrame:self.window.bounds];
    myView.backgroundColor = [UIColor redColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.window.bounds];
    imageView.image = [UIImage imageNamed:@"Alexstrasza_full"];
    [self.window addSubview:myView];
    
//    [self.window bringSubviewToFront:myView];
//self.window.rootViewController = mainViewController;
//    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(removeAd) userInfo:nil repeats:NO];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *mainViewController = [storyboard instantiateInitialViewController];
        self.window.rootViewController = mainViewController;
        [myView removeFromSuperview];
    });
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
