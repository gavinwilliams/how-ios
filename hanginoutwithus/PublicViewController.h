//
//  PublicController.h
//  how
//
//  Created by Gavin Williams on 09/08/2010.
//  Copyright 2010 fishrod interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventCell.h"
#import "EventModel.h"


@interface PublicViewController : UIViewController <UITableViewDataSource> {
	IBOutlet UITableView *publicEventsTable;
	EventModel *eventMock;
}

@property (retain, nonatomic) IBOutlet UITableView *publicEventsTable;

@end