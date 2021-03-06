//
//  FRViewController.m
//  hanginoutwithus
//
//  Created by Gavin Williams on 22/05/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import "FRViewController.h"

@implementation FRViewController

@synthesize navigationViewController;

- (id) initWithNavigationViewController:(NavigationController *)_controller {
	self = [self init];
	if(self){
		[self setNavigationViewController:_controller];
	}
	return self;
}

-(id) init {
	
	self = [super init];
	if(self){
		UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo-theme3.png"]];
		self.navigationItem.titleView = logo;
		[logo release];
	}
	
	return self;
}

- (void)dealloc
{	
	
	[navigationViewController release];
    [super dealloc];
}

- (void)viewDidUnload
{
	
	[self setNavigationViewController:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end