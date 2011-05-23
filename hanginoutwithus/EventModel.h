//
//  EventModel.h
//  how
//
//  Created by Gavin Williams on 17/07/2010.
//  Copyright 2010 fishrod interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventModel : NSObject {
	NSInteger *id;
	NSString *name;
	NSDate *start;
	NSDate *end;
	NSString *intro;
	NSString *description;
	NSString *contactNumber;
	NSString *restrictions;
	NSString *dressCode;
	NSString *venue;
	NSString *organiser;
	NSString *parent;
	NSString *type;
	NSString *visibility;
	NSData *image;
}

@property (assign, nonatomic) NSInteger *id;
@property (retain, nonatomic) NSString *name;
@property (retain, nonatomic) NSDate *start;
@property (retain, nonatomic) NSDate *end;
@property (retain, nonatomic) NSString *intro;
@property (retain, nonatomic) NSString *description;
@property (retain, nonatomic) NSString *contactNumber;
@property (retain, nonatomic) NSString *restrictions;
@property (retain, nonatomic) NSString *dressCode;
@property (retain, nonatomic) NSString *venue;
@property (retain, nonatomic) NSString *organiser;
@property (retain, nonatomic) NSString *parent;
@property (retain, nonatomic) NSString *type;
@property (retain, nonatomic) NSString *visibility;
@property (retain, nonatomic) NSData *image;

-(id)initFromDictionary:(NSDictionary *)dictionary;

@end
