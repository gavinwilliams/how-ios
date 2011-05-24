//
//  HangOutsViewController.h
//  hanginoutwithus
//
//  Created by Gavin Williams on 22/05/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRViewController.h"

@interface HangOutsViewController : FRViewController <UINavigationControllerDelegate> {
    UINavigationController *navigationController;
}

@property (assign, nonatomic) UINavigationController *navigationController;

@end