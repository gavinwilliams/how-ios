//
//  FRSlideMenu.h
//  hanginoutwithus
//
//  Created by Gavin Williams on 19/02/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRSlideMenuItem.h"

typedef enum {
	FRSlideMenuErrorPlistDoesNotExist
} FRSlideMenuError;

@interface FRSlideMenu : NSObject {
	NSMutableArray *items;
}

#pragma mark -
#pragma mark Designated Initialisers

-(id)initWithPlist:(NSString *)plist;


#pragma mark -
#pragma mark Menu Management Methods

-(bool)populateFromPlist:(NSString *)thePlist error:(NSError **) theError;

@end
