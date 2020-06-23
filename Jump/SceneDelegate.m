//
//  SceneDelegate.m
//  Jump
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"
#import "RecommdViewController.h"
#import "LoginViewController.h"
#import "FindGameViewController.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"firstLogin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    

    
    RecommdViewController *mainController = [[RecommdViewController alloc]init];
    UINavigationController *v1 = [[UINavigationController alloc]initWithRootViewController:mainController];
    v1.navigationBar.barTintColor = [UIColor whiteColor];
    v1.navigationBar.translucent = NO;
    v1.tabBarItem.title = @"首页";
    
    FindGameViewController *findController = [[FindGameViewController alloc]init];
    UINavigationController *v2 = [[UINavigationController alloc]initWithRootViewController:findController];
    v2.navigationBar.barTintColor = [UIColor whiteColor];
    v2.navigationBar.translucent = NO;
    v2.tabBarItem.title = @"二页";
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [UITabBar appearance].translucent = NO;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
    self.window.backgroundColor = [UIColor whiteColor];
    UITabBarController *bar = [[UITabBarController alloc]init];
    bar.viewControllers = @[v1,v2];
    self.window.rootViewController = bar;
    [self.window makeKeyAndVisible];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"firstLogin"] == nil) {

  
    }
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.

    // Save changes in the application's managed object context when the application transitions to the background.
    [(AppDelegate *)UIApplication.sharedApplication.delegate saveContext];
}


@end
