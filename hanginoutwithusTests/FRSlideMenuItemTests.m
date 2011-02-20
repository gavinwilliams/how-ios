//
//  FRSlideMenuItemTests.m
//  hanginoutwithus
//
//  Created by Gavin Williams on 20/02/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import "FRSlideMenuItemTests.h"


@implementation FRSlideMenuItemTests : SenTestCase

#pragma mark -
#pragma mark Test set up/tear down

- (void)setUp
{
    [super setUp];

    // Set-up code here.
	menuItem = [[FRSlideMenuItem alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
}

#pragma mark -
#pragma mark Unit Tests

-(void)testAddMenuItemWithoutTitle {
	
	// Declerations
	NSError *error = nil;
	FRSlideMenuItem *child = [[FRSlideMenuItem alloc] init];

	// Assignments for testing
	bool addResponse = [menuItem addChild:child error:&error];
	[child release];
	NSArray *children = [menuItem getChildren];
	
	// Assertions
	STAssertFalse(addResponse, @"Cannot insert menu item without title");
	STAssertEquals([error localizedDescription], @"Child title must not be empty", @"Correct error message returned");
	STAssertEquals([error code], FRMenuItemErrorNoChildTitle, @"Correct error code returned");
	STAssertTrue([children count] == 0, @"Child count equals 0");
	
}

-(void)testAddMenuItemWithTitle {
	
	// Declerations
	NSError *error = nil;
	FRSlideMenuItem *child = [[FRSlideMenuItem alloc] init];
	
	// Working code
	[child setTitle:@"My Title"];
	
	// Assignments for testing
	bool addResponse = [menuItem addChild:child error:&error];
	[child release];
	NSArray *children = [menuItem getChildren];
	
	// Assertions
	STAssertTrue(addResponse, @"Can add menu item with title");
	STAssertNil(error, @"No error returned");
	STAssertTrue([children count] == 1, @"Child count equals 1");
	
}

@end