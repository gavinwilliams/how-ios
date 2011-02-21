//
//  FRSlideMenu.m
//  hanginoutwithus
//
//  Created by Gavin Williams on 19/02/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import "FRSlideMenu.h"

NSString *const FRSlideMenuErrorDomain = @"FRSlideMenuError";

@implementation FRSlideMenu


#pragma mark -
#pragma mark Designated Initialisers

-(id)init {
	if((self = [super init])){
		
	}
	
	return self;
}

-(id)initWithPlist:(NSString *)plist {
	
	if((self = [self init])){
		
	}
	
	return self;
}

#pragma mark -
#pragma mark Menu Management Methods

-(bool)populateFromPlist:(NSString *)plist error:(NSError **)theError {
	
	NSString *plistpath = [[NSBundle mainBundle] pathForResource:plist ofType:@"plist"];
	NSLog(@"Path: %@", plist);
	
	if(plistpath == nil){
		NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
		[errorDetail setValue:@"Plist does not exist" forKey:NSLocalizedDescriptionKey];
		*theError = [NSError errorWithDomain:FRSlideMenuErrorDomain code:FRSlideMenuErrorPlistDoesNotExist userInfo:errorDetail];	
		return false;
	}
	
	NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistpath];
	
	if(dictionary == nil){
		NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
		[errorDetail setValue:@"Plist could not be processed, invalid data" forKey:NSLocalizedDescriptionKey];
		*theError = [NSError errorWithDomain:FRSlideMenuErrorDomain code:FRSlideMenuErrorPlistInvalid userInfo:errorDetail];
		return false;
	}
	
	NSArray *menu = [dictionary objectForKey:@"navigation"];
	
	for (NSDictionary *item in menu) {
		
	}
	
	return true;
	
}


@end
