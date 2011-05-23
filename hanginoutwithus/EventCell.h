//
//  EventCell.h
//  how
//
//  Created by Gavin Williams on 12/07/2010.
//  Copyright 2010 fishrod interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventModel.h"

@interface EventCell : UITableViewCell {
	EventModel *event;
	UILabel *titleLabel;
	UILabel *descriptionLabel;
	UILabel *timeLabel;
	UIImageView *eventImage;
}

@property (nonatomic, retain) EventModel *event;

-(void)setEventData:(EventModel *)theEvent;

@end
