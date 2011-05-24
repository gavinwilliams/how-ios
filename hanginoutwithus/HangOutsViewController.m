//
//  HangOutsViewController.m
//  hanginoutwithus
//
//  Created by Gavin Williams on 22/05/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import "HangOutsViewController.h"
#import "EventsRootViewController.h"

@implementation UINavigationBar (custom)
- (void)drawRect:(CGRect)rect {}
@end

@implementation HangOutsViewController
@synthesize navigationController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    EventsRootViewController *eventsView = [[EventsRootViewController alloc] initWithNavigationViewController:self.navigationViewController];
    navigationController = [[UINavigationController alloc] initWithRootViewController:eventsView];
	[navigationController setDelegate:self];
    [navigationController setWantsFullScreenLayout:NO];
	navigationController.navigationBar.backgroundColor = [UIColor clearColor];
	navigationController.view.frame = CGRectMake(navigationController.view.frame.origin.x, 20, navigationController.view.frame.size.width, navigationController.view.frame.size.height - 70);
    [self.view addSubview:navigationController.view];
	
    [eventsView release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
