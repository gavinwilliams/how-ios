//
//  EventsRootViewController.m
//  hanginoutwithus
//
//  Created by Gavin Williams on 24/05/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import "EventsRootViewController.h"
#import "EventViewController.h"
#import "PublicEventsViewController.h"

@implementation EventsRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo-theme3.png"]];
        self.navigationItem.titleView = logo;
        [logo release];
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
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
    [scrollView setBackgroundColor:[UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0]];
    PublicEventsViewController *publicEventsVC = [[PublicEventsViewController alloc] init];
    [publicEventsVC.view setFrame:CGRectMake((self.view.frame.size.width / 2) - (publicEventsVC.view.frame.size.width / 2), 95, publicEventsVC.view.frame.size.width, publicEventsVC.view.frame.size.height)];
    scrollView.contentSize = CGSizeMake(320, (95 + 405));
    [scrollView addSubview:publicEventsVC.view];
    [self.view addSubview:scrollView];
    
    // Do any additional setup after loading the view from its nib.
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
