//
//  EventCell.m
//  how
//
//  Created by Gavin Williams on 12/07/2010.
//  Copyright 2010 fishrod interactive. All rights reserved.
//

#import "EventCell.h"


@implementation EventCell
@synthesize event;

- (UILabel *) drawEventTitle {
	titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(77, 10, 170, 15)];
	titleLabel.opaque = false;
	titleLabel.textColor = [UIColor colorWithRed: 1 green:1 blue:1 alpha:1];
	titleLabel.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
	titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:16];
	return [titleLabel autorelease];
}

- (UILabel *) drawEventDescription {
	descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(77, 29, 170, 25)];
	descriptionLabel.numberOfLines = 2;
	descriptionLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
	descriptionLabel.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
	descriptionLabel.font = [UIFont fontWithName:@"Arial" size:11];
	return [descriptionLabel autorelease];
}

- (UIView *) drawEventTime {
	timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(77, 55, 170, 15)];
	timeLabel.text = @"1pm - 7pm";
	timeLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12];
	timeLabel.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
	timeLabel.textColor = [UIColor colorWithRed:1 green:0.603921568627451 blue:0.019607843137255 alpha:1];
	return [timeLabel autorelease];
}

- (UIImageView *) drawEventImage {
	eventImage = [[UIImageView alloc] initWithFrame:CGRectMake(8, 9, 60, 60)];
	return [eventImage autorelease];
}

- (UIView *) drawSelectedBackground {
	UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 298, 78)];
	background.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.70];
	return [background autorelease];
}

- (void) setEventData:(EventModel *)theEvent {
	
	titleLabel.text = theEvent.name;
	
	descriptionLabel.text = theEvent.intro;

	eventImage.image = [[UIImage alloc] initWithData:theEvent.image];
	
}

- (UIImageView *) drawCellBorder {
	UIImageView *border = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider-cell"]];
	border.frame = CGRectMake(6, 73, border.frame.size.width, border.frame.size.height);
	border.opaque = NO;
	return [border autorelease];
}

- (void) drawCell {

	[self setSelectedBackgroundView: [self drawSelectedBackground]];

	[self addSubview: [self drawEventTitle]];

	[self addSubview: [self drawEventDescription]];
	[self addSubview: [self drawEventTime]];
	[self addSubview: [self drawCellBorder]];
	[self addSubview: [self drawEventImage]];

}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
		self.event = [[EventModel alloc] init];
		[self drawCell];
    }
    return self;
}		   

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


- (void)dealloc {
	[event release];
	[eventImage release];
    [super dealloc];
}


@end
