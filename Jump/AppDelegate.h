//
//  AppDelegate.h
//  Jump
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;


@end

