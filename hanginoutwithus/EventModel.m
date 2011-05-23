//
//  EventModel.m
//  how
//
//  Created by Gavin Williams on 17/07/2010.
//  Copyright 2010 fishrod interactive. All rights reserved.
//

#import "EventModel.h"


@implementation EventModel
@synthesize id, name, start, intro, description, contactNumber, restrictions, dressCode, venue, organiser, parent, type, visibility, end, image;

-(id)initFromDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		self.id = (NSInteger *) [dictionary objectForKey:@"id"];
		self.intro = [dictionary objectForKey:@"intro"];
		self.name = [dictionary objectForKey:@"name"];
		/*
		 self.start = [dictionary objectForKey:@"start"];
		 self.end = [dictionary objectForKey:@"end"];
		 self.
		 */
		
	}
	return self;
}

@end
