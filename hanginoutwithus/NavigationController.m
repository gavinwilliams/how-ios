//
//  NavigationController.m
//  hanginoutwithus
//
//  Created by Gavin Williams on 08/05/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import "NavigationController.h"
#import <QuartzCore/QuartzCore.h>

@implementation NavigationController
@synthesize itemHangOuts;
@synthesize subHangOutsInvite;
@synthesize subHangOutsShare;
@synthesize subHangOuts;
@synthesize itemFavourites;
@synthesize subFavourites;
@synthesize subFavouritesInvite;
@synthesize subFavouritesShare;
@synthesize itemMe;
@synthesize itemSettings;
@synthesize containerView;
@synthesize hangOutsViewController;
@synthesize settingsViewController;
@synthesize favouritesViewController;
@synthesize meViewController;


enum NavigationItemType {
	kHangOuts = 1,
	kHangOutsInvite,
	kHangOutsShare,
	kFavourites,
	kFavouritesInvite,
	kFavouritesShare,
	kMe,
	kSettings
};


- (void)dealloc
{
	[settingsViewController release];
	[meViewController release];
	[favouritesViewController release];
	[hangOutsViewController release];
	[itemHangOuts release];
	[subHangOutsInvite release];
	[subHangOutsShare release];
	[subHangOuts release];
	[itemFavourites release];
	[subFavourites release];
	[subFavouritesInvite release];
	[subFavouritesShare release];
	[itemMe release];
	[itemSettings release];
	[containerView release];
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
	// Load up the view controllers
	hangOutsViewController = [[HangOutsViewController alloc] initWithNavigationViewController:self];
	[containerView addSubview:hangOutsViewController.view];
	
	favouritesViewController = [[FavouritesViewController alloc] initWithNavigationViewController:self];
	favouritesViewController.view.hidden = YES;
	[containerView addSubview:favouritesViewController.view];
	
	meViewController = [[MeViewController alloc] initWithNavigationViewController:self];
	meViewController.view.hidden = YES;
	[containerView addSubview:meViewController.view];
	
	settingsViewController = [[SettingsViewController alloc] initWithNavigationViewController:self];
	settingsViewController.view.hidden = YES;
	[containerView addSubview:settingsViewController.view];
	
	subHangOutsCenter = [subHangOuts center];
	subHangOutsFrame = [subHangOuts frame];
	
	subFavouritesCenter = [subFavourites center];
	subFavouritesFrame = [subFavourites frame];
	
	itemHangOuts.selected = YES;
	
	// Close the hangouts navigation
	
	subHangOutsIsOpen = YES;
	subFavouritesIsOpen = YES;
    
    [self setWantsFullScreenLayout:YES];
	
	[self closeHangOuts:NO];
	[self closeFavourites:NO];

    // Do any additional setup after loading the view from its nib.
	[super viewDidLoad];
}

-(void)closeHangOuts:(BOOL)animate {
	
	if(subHangOutsIsOpen == NO){
		return;
	}
	
	if(animate == YES){
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.25];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	}
	
	// Make the frame 0 width
	CGRect subnavFrame = [subHangOuts frame];
	
	[subHangOuts setFrame:CGRectMake(subnavFrame.origin.x, subnavFrame.origin.y, 0, subnavFrame.size.height)];
	
	// Move all other elements
	[itemFavourites setCenter:CGPointMake((itemFavourites.center.x - subnavFrame.size.width), itemFavourites.center.y)];
	[subFavourites setCenter:CGPointMake((subFavourites.center.x - subnavFrame.size.width), subFavourites.center.y)];
	[itemMe setCenter:CGPointMake((itemMe.center.x - subnavFrame.size.width), itemMe.center.y)];
	[itemSettings setCenter:CGPointMake((itemSettings.center.x - subnavFrame.size.width), itemSettings.center.y)];
	
	if(animate == YES){
		[UIView commitAnimations];
	}
	
	subHangOutsIsOpen = NO;
	
}

-(void)openHangOuts:(BOOL)animate {
	
	if(subHangOutsIsOpen == YES){
		return;
	}
	
	if(animate == YES){
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.25];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	}
	
	[subHangOuts setFrame:subHangOutsFrame];
	
	[itemFavourites setCenter:CGPointMake((itemFavourites.center.x + subHangOutsFrame.size.width), itemFavourites.center.y)];
	[subFavourites setCenter:CGPointMake((subFavourites.center.x + subHangOutsFrame.size.width), subFavourites.center.y)];
	[itemMe setCenter:CGPointMake((itemMe.center.x + subHangOutsFrame.size.width), itemMe.center.y)];
	[itemSettings setCenter:CGPointMake((itemSettings.center.x + subHangOutsFrame.size.width), itemSettings.center.y)];
	
	if(animate == YES){
		[UIView commitAnimations];
	}
	
	subHangOutsIsOpen = YES;
	
}

-(void)closeFavourites:(BOOL)animate {
	
	if(subFavouritesIsOpen == NO){
		return;
	}
	
	if(animate == YES){
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.25];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	}

	// Make the frame 0 width
	CGRect subnavFrame = [subFavourites frame];
	
	[subFavourites setFrame:CGRectMake(subnavFrame.origin.x, subnavFrame.origin.y, 0, subnavFrame.size.height)];
	
	// Move all other elements
	[itemMe setCenter:CGPointMake((itemMe.center.x - subnavFrame.size.width), itemMe.center.y)];
	[itemSettings setCenter:CGPointMake((itemSettings.center.x - subnavFrame.size.width), itemSettings.center.y)];
	
	if(animate == YES){
		[UIView commitAnimations];
	}
	
	subFavouritesIsOpen = NO;
}

-(void)openFavourites:(BOOL)animate {
	
	if(subFavouritesIsOpen == YES){
		return;
	}
	
	if(animate == YES){
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.25];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	}
    
    float offset = (itemFavourites.frame.origin.x + itemFavourites.frame.size.width);
    
	[subFavourites setFrame:CGRectMake(offset, subFavouritesFrame.origin.y, subFavouritesFrame.size.width, subFavouritesFrame.size.height)];
    
	// Move all other elements
	[itemMe setCenter:CGPointMake((itemMe.center.x + subFavouritesFrame.size.width), itemMe.center.y)];
	[itemSettings setCenter:CGPointMake((itemSettings.center.x + subFavouritesFrame.size.width), itemSettings.center.y)];
	
	if(animate == YES){
		[UIView commitAnimations];
	}
	
	subFavouritesIsOpen = YES;
}

- (IBAction)itemSelect:(UIButton *)button {
	
    switch (button.tag) {
        case kHangOuts:
            [hangOutsViewController.view setHidden:NO];
			[meViewController.view setHidden:YES];
			[settingsViewController.view setHidden:YES];
			[favouritesViewController.view setHidden:YES];
			itemHangOuts.selected = YES;
			itemFavourites.selected = NO;
			itemMe.selected = NO;
			itemSettings.selected = NO;
            break;
        case kHangOutsInvite:
            break;
        case kHangOutsShare:
            break;
        case kFavourites:
            [hangOutsViewController.view setHidden:YES];
			[meViewController.view setHidden:YES];
			[settingsViewController.view setHidden:YES];
			[favouritesViewController.view setHidden:NO];
			itemHangOuts.selected = NO;
			itemFavourites.selected = YES;
			itemMe.selected = NO;
			itemSettings.selected = NO;
            break;
        case kFavouritesInvite:
            break;
        case kFavouritesShare:
            break;
        case kMe:
            [hangOutsViewController.view setHidden:YES];
			[meViewController.view setHidden:NO];
			[settingsViewController.view setHidden:YES];
			[favouritesViewController.view setHidden:YES];
			itemHangOuts.selected = NO;
			itemFavourites.selected = NO;
			itemMe.selected = YES;
			itemSettings.selected = NO;
            break;
        case kSettings:
            [hangOutsViewController.view setHidden:YES];
			[meViewController.view setHidden:YES];
			[settingsViewController.view setHidden:NO];
			[favouritesViewController.view setHidden:YES];
			itemHangOuts.selected = NO;
			itemFavourites.selected = NO;
			itemMe.selected = NO;
			itemSettings.selected = YES;
            break;
    }
}

-(void)toggleHangOuts {
	if(subHangOutsIsOpen == YES){
		[self closeHangOuts:YES];
	} else {
		[self openHangOuts:YES];
		[self closeFavourites:YES];
	}
}

-(void)toggleFavourites {
	if(subFavouritesIsOpen == YES){
		[self closeFavourites:YES];
	} else {
		[self openFavourites:YES];
		[self closeHangOuts:YES];
	}
}

- (void)viewDidUnload
{
	[self setSettingsViewController: nil];
	[self setFavouritesViewController:nil];
	[self setMeViewController:nil];
	[self setHangOutsViewController:nil];
	[self setItemHangOuts:nil];
	[self setSubHangOutsInvite:nil];
	[self setSubHangOutsShare:nil];
	[self setSubHangOuts:nil];
	[self setItemFavourites:nil];
	[self setSubFavourites:nil];
	[self setSubFavouritesInvite:nil];
	[self setSubFavouritesShare:nil];
	[self setItemMe:nil];
	[self setItemSettings:nil];
	[self setContainerView:nil];
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
