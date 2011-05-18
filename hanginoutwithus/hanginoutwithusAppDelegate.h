//
//  hanginoutwithusAppDelegate.h
//  hanginoutwithus
//
//  Created by Gavin Williams on 10/02/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationController.h"
#import "Three20/Three20.h"

@interface hanginoutwithusAppDelegate : NSObject <UIApplicationDelegate> {
	NavigationController *_navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) NavigationController *navigationController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
