//
//  NavigationController.h
//  hanginoutwithus
//
//  Created by Gavin Williams on 08/05/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface NavigationController : UIViewController {
    
	UIButton *itemHangOuts;
	UIButton *subHangOutsInvite;
	UIButton *subHangOutsShare;
	UIView *subHangOuts;
	UIButton *itemFavourites;
	UIView *subFavourites;
	UIButton *subFavouritesInvite;
	UIButton *subFavouritesShare;
	UIButton *itemMe;
	UIButton *itemSettings;
	
	CGRect subHangOutsFrame;
	CGPoint subHangOutsCenter;
	BOOL subHangOutsIsOpen;
	
	CGRect subFavouritesFrame;
	CGPoint subFavouritesCenter;
	BOOL subFavouritesIsOpen;
	
}

@property (nonatomic, retain) IBOutlet UIButton *itemHangOuts;
@property (nonatomic, retain) IBOutlet UIButton *subHangOutsInvite;
@property (nonatomic, retain) IBOutlet UIButton *subHangOutsShare;
@property (nonatomic, retain) IBOutlet UIView *subHangOuts;
@property (nonatomic, retain) IBOutlet UIButton *itemFavourites;
@property (nonatomic, retain) IBOutlet UIView *subFavourites;
@property (nonatomic, retain) IBOutlet UIButton *subFavouritesInvite;
@property (nonatomic, retain) IBOutlet UIButton *subFavouritesShare;
@property (nonatomic, retain) IBOutlet UIButton *itemMe;
@property (nonatomic, retain) IBOutlet UIButton *itemSettings;

-(void)closeHangOuts:(BOOL) animate;
-(void)openHangOuts:(BOOL) animate;
-(void)closeFavourites:(BOOL) animate;
-(void)openFavourites:(BOOL) animate;

-(void)toggleHangOuts;
-(void)toggleFavourites;

- (IBAction)subNavToggle:(UIButton *)button;


@end
