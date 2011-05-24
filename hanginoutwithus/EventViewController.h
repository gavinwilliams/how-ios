//
//  EventViewController.h
//  hanginoutwithus
//
//  Created by Gavin Williams on 24/05/2011.
//  Copyright 2011 fishrod interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRViewController.h"

@interface EventViewController : FRViewController {
    FRViewController *parent;
}

@property (retain, nonatomic) FRViewController *parent;

@end
