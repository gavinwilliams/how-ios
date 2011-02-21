//
//  FRSlideMenuTests.m
//  hanginoutwithus
//
//  Created by Gavin Williams on 20/02/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import "FRSlideMenuTests.h"


@implementation FRSlideMenuTests : SenTestCase


#pragma mark -
#pragma mark Test set up/tear down

- (void)setUp
{
    [super setUp];
	
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
}

-(void)testNonExistantPlist {
	FRSlideMenu *menu = [[FRSlideMenu alloc] init];
	NSError *error = nil;
	
	bool populateResponse = [menu populateFromPlist:@"non-existant-file" error:&error];
	
	STAssertFalse(populateResponse, @"Returns false for non-existant file");
	STAssertNotNil(error, @"Error is not nil");
	STAssertEquals([error code], FRSlideMenuErrorPlistDoesNotExist, @"Error code is correct");
	STAssertEquals([error localizedDescription], @"Plist does not exist", @"Error message is correct");
	
}

-(void)testValidPlist {
	FRSlideMenu *menu = [[FRSlideMenu alloc] init];
	NSError *error = nil;
	
	bool populateResponse = [menu populateFromPlist:@"navigation" error:&error];
	
	STAssertTrue(populateResponse, @"Returns true for existing file");
	STAssertNil(error, @"Error is nil");
	
}

@end
