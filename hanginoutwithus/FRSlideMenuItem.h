//
//  FRSlideMenuItem.h
//  hanginoutwithus
//
//  Created by Gavin Williams on 19/02/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRSlideMenuIcon.h"

typedef enum {
	FRMenuItemErrorNoChildTitle,
	FRMenuItemErrorNoChildIcon
} FRMenuItemError;

@interface FRSlideMenuItem : NSObject {
	
	@private
	FRSlideMenuItem *parent; // The parent item
	NSMutableArray *children; // All sub items for this menu item
	NSString *title; // The title for this menu item
	FRSlideMenuIcon *icon; // The icon for this menu item
	
}

#pragma mark -
#pragma mark Properties
@property (retain) NSString *title;
@property (retain) FRSlideMenuIcon *icon;

#pragma mark -
#pragma mark Designated Initialisers
-(id)initWithTitle:(NSString *)theTitle icon:(FRSlideMenuIcon *)theIcon;

#pragma mark -
#pragma mark Menu Item Management Methods
-(bool)addChild:(FRSlideMenuItem *)theItem error:(NSError **)theError;
-(void)removeChild:(FRSlideMenuItem *)theItem;
-(void)removeChildAtIndex:(int)theIndex;
-(NSMutableArray *)getChildren;

@end
