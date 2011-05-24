//
//  PublicController.m
//  how
//
//  Created by Gavin Williams on 09/08/2010.
//  Copyright 2010 fishrod interactive. All rights reserved.
//

#import "PublicEventsViewController.h"
#import "EventViewController.h"

@implementation PublicEventsViewController
@synthesize publicEventsTable, parent;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil  {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		eventMock = [[EventModel alloc] init];
		eventMock.intro = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam at velit risus, vitae pretium velit.";
		eventMock.name = @"Hed Kandi";
		eventMock.image = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://www.gig-tickets-guide.co.uk/wp-content/uploads/2010/05/glastonbury-festival-gig-tickets-guide.jpg"]];
    }
    return self;
}

// Table view methods
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"PublicEvent";
    
    EventCell *cell = (EventCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		NSLog(@"Creating new cell");
        cell = [[[EventCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

	[cell setEventData:eventMock];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EventViewController *theEvent = [[EventViewController alloc] init];
	[theEvent setParent:parent];
    [parent.navigationController pushViewController:theEvent animated:YES];
    [theEvent release];
}

-(NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return 500;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}



/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[eventMock release];
	[self.publicEventsTable release];
}


@end
