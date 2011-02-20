//
//  FRSlideMenuIcon.m
//  hanginoutwithus
//
//  Created by Gavin Williams on 19/02/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import "FRSlideMenuIcon.h"


@implementation FRSlideMenuIcon
@synthesize normal;
@synthesize highlighted;

+(FRSlideMenuIcon *)iconWithImage:(NSString *)theImage highlighted:(NSString *)theHighlightedImage error:(NSError **)theError {
	
	FRSlideMenuIcon *icon = [[[FRSlideMenuIcon alloc] init] autorelease];
	[icon setNormal:theImage];
	[icon setHighlighted:theHighlightedImage];
	
	return icon;
	
}

@end
