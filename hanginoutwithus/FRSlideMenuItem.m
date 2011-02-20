//
//  FRSlideMenuItem.m
//  hanginoutwithus
//
//  Created by Gavin Williams on 19/02/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import "FRSlideMenuItem.h"


@implementation FRSlideMenuItem

#pragma mark -
#pragma mark Properties
@synthesize title;
@synthesize icon;
@synthesize parent;

#pragma mark -
#pragma mark Designated Initialisers

-(id)init {
	
	if((self = [super init])){
		// Allocations, remember to release!
		title = [[NSString alloc] init];
		icon = [[FRSlideMenuIcon alloc] init];
		children = [[NSMutableArray alloc] init];
	}
	
	return self;
}

-(id)initWithTitle:(NSString *)theTitle icon:(FRSlideMenuIcon *)theicon {
	
	if((self = [self init])){
		// Set the title and icon
		[self setTitle:theTitle];
		[self setIcon:theicon];
	}
	
	return self;
}

#pragma mark -
#pragma mark Menu Management Methods

-(bool)addChild:(FRSlideMenuItem *)theItem error:(NSError **)theError {
	
	if([FRSlideMenuItem validateMenuItem:theItem error:theError] == false){
		return false;
	}
	
	[theItem setParent:self];
	[children addObject:theItem];
	return true;
	
}

-(void)removeChild:(FRSlideMenuItem *)theItem {
	[children removeObject:theItem];
}

-(void)removeChildAtIndex:(int)theIndex {
	[children removeObjectAtIndex:theIndex];
}

-(NSMutableArray *)getChildren {
	return children;
}

#pragma mark -
#pragma mark Menu Item Validation Methods

+(bool)validateMenuItem:(FRSlideMenuItem *)theItem error:(NSError **)theError {
	
	if([[theItem title] length] == 0){
		NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
		[errorDetail setValue:@"Title must not be empty" forKey:NSLocalizedDescriptionKey];
		*theError = [NSError errorWithDomain:@"FRSlideMenu" code:FRMenuItemErrorNoTitle userInfo:errorDetail];		
		return false;
	}
	
	return true;
	
}

#pragma mark -
#pragma mark Dealocators

-(void)dealloc {
	[title release];
	[icon release];
	[children release];
	[super dealloc];
}

@end