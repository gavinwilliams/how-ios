//
//  FRViewController.h
//  hanginoutwithus
//
//  Created by Gavin Williams on 22/05/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NavigationController;

@interface FRViewController : UIViewController {
    NavigationController *navigationViewController;
}

@property (retain, nonatomic) NavigationController *navigationViewController;

- (id) initWithNavigationViewController:(NavigationController *)_controller;

@end