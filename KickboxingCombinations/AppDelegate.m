//
//  AppDelegate.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "AppDelegate.h"
#import "TAGContainer.h"
#import "TAGContainerOpener.h"
#import "TAGManager.h"
#import "TAGDataLayer.h"

@interface AppDelegate ()<TAGContainerOpenerNotifier, TAGContainerCallback>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //GTM
    self.tagManager = [TAGManager instance];
    [self.tagManager.logger setLogLevel:kTAGLoggerLogLevelVerbose];
    [TAGContainerOpener openContainerWithId:@"GTM-M9CBHM"
                                 tagManager:self.tagManager
                                   openType:kTAGOpenTypePreferNonDefault
                                    timeout:nil
                                   notifier:self];
    NSTimeInterval dispatchTime = 10;
    self.tagManager.dispatchInterval = dispatchTime;
    NSLog(@"Dispatch Time: %f", [[TAGManager instance] dispatchInterval]);
    //GA
//    [GAI sharedInstance].trackUncaughtExceptions = YES;
//    [GAI sharedInstance].dispatchInterval = 20;
//    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelNone];
//    [[GAI sharedInstance] trackerWithTrackingId:@"UA-59762855-1"];
    return YES;
}

//These three methods do no seem to be firing...
-(void)containerRefreshBegin:(TAGContainer *)container refreshType:(TAGContainerCallbackRefreshType)refreshType {
    if (refreshType == kTAGContainerCallbackRefreshTypeSaved) {
        NSLog(@"Will Refresh From Saved File");
    }
    else {
        NSLog(@"Will Refresh From Network Call");
    }
}

-(void)containerRefreshSuccess:(TAGContainer *)container refreshType:(TAGContainerCallbackRefreshType)refreshType {
    if (refreshType == kTAGContainerCallbackRefreshTypeSaved) {
        NSLog(@"Refreshed From Saved File");
    }
    else {
        NSLog(@"Refreshed From Network Call");
    }
}

-(void)containerRefreshFailure:(TAGContainer *)container failure:(TAGContainerCallbackRefreshFailure)failure refreshType:(TAGContainerCallbackRefreshType)refreshType {
    switch (failure) {
        case kTAGContainerCallbackRefreshFailureIoError:
            NSLog(@"Refresh Error: IO Error");
            break;
        case kTAGContainerCallbackRefreshFailureNetworkError:
            NSLog(@"Refresh Error: Network Error");
            break;
        case kTAGContainerCallbackRefreshFailureNoNetwork:
            NSLog(@"Refresh Error: No Network");
            break;
        case kTAGContainerCallbackRefreshFailureNoSavedContainer:
            NSLog(@"Refresh Error: No Saved Container");
            break;
        case kTAGContainerCallbackRefreshFailureServerError:
            NSLog(@"Refresh Error: Server Error");
            break;
        case kTAGContainerCallbackRefreshFailureUnknownError:
            NSLog(@"Refresh Error: Unknown Error");
            break;
        default:
            break;
    }
    
}

-(void)containerAvailable:(TAGContainer *)container {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.container = container;
        [self.container refresh];
    });
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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "VL.KickboxingCombinations" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"KickboxingCombinations" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"KickboxingCombinations.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
