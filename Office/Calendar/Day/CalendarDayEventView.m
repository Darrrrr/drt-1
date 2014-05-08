//
//  CalendarDayEventView.m
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import "CalendarDayEventView.h"
#import "UIColor + Category.h"

#define FONT_SIZE 12.0

#pragma mark - CalendarDayEventView
@implementation CalendarDayEventView

#pragma mark Init & Friends
+ (CalendarDayEventView*) eventView{
	CalendarDayEventView *event = [[CalendarDayEventView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
	return event;
}

+ (CalendarDayEventView*) eventViewWithIdentifier:(NSNumber *)identifier startDate:(NSDate *)startDate endDate:(NSDate *)endDate title:(NSString *)title location:(NSString *)location{
	
	CalendarDayEventView *event = [[CalendarDayEventView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
	event.identifier = identifier;
	event.startDate = startDate;
	event.endDate = endDate;
	event.titleLabel.text = title;
	event.locationLabel.text = location;
	return event;
}
- (id) initWithFrame:(CGRect)frame {
    if(!(self=[super initWithFrame:frame])) return nil;
    [self _setupView];
    return self;
}
- (id) initWithCoder:(NSCoder *)decoder {
    if(!(self=[super initWithCoder:decoder])) return nil;
    [self _setupView];
	return self;
}
- (void) _setupView{
	
	self.alpha = 1;
    
	
	CGRect r = CGRectInset(self.bounds, 5, 22);
	r.size.height = 14;
	r.origin.y = 5;
	
	self.titleLabel = [[UILabel alloc] initWithFrame:r];
	self.titleLabel.numberOfLines = 2;
	self.titleLabel.backgroundColor = [UIColor clearColor];
	self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	self.titleLabel.textColor = [UIColor colorWithHex:0x1a719e];//0x1a719e
	self.titleLabel.font = [UIFont boldSystemFontOfSize:12];
	[self addSubview:self.titleLabel];
    
	
	r.origin.y = 20;
	r.size.height = 14*2;
	
	self.locationLabel = [[UILabel alloc] initWithFrame:r];
	self.locationLabel.numberOfLines = 2;
	self.locationLabel.backgroundColor = [UIColor clearColor];
	self.locationLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	self.locationLabel.textColor = [UIColor colorWithHex:0x1a719e];//0x1a719e
	self.locationLabel.font = [UIFont systemFontOfSize:12];
	[self addSubview:self.locationLabel];
	
	self.edgeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, CGRectGetHeight(self.frame))];
	self.edgeView.backgroundColor = [UIColor colorWithHex:0x1badf8];//0x1badf8
	self.edgeView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
	[self addSubview:self.edgeView];
	
	self.backgroundColor = [UIColor colorWithHex:0x72c8f3 alpha:0.2];//0x72c8f3
	
}

- (void) layoutSubviews{
	[super layoutSubviews];
	
	CGFloat h = CGRectGetHeight(self.frame);
	if(h < 45){
		self.titleLabel.frame = CGRectInset(self.bounds, 5, 5);
		CGFloat y = CGRectGetMaxY(self.titleLabel.frame);
		self.locationLabel.frame = CGRectMake(CGRectGetMinX(self.titleLabel.frame), y, 0, 0);
		self.locationLabel.hidden = YES;
		return;
	}
    
	
	CGFloat hh = h > 200 ? 14 * 2 : 14;
	CGRect r = CGRectInset(self.bounds, 5, 5);
	r.size.height = hh;
	r = CGRectIntersection(r, self.bounds);
	
	self.titleLabel.frame = r;
	[self.titleLabel sizeToFit];
	
	hh = h > 200 ? (FONT_SIZE+2.0) * 2 : FONT_SIZE+2;
	r = CGRectInset(self.bounds, 5, 5);
	r.size.height = hh;
	r.origin.y += CGRectGetHeight(self.titleLabel.frame);
	r = CGRectIntersection(r, self.bounds);
    
	self.locationLabel.frame = r;
	self.locationLabel.hidden = self.locationLabel.text.length > 0 ? NO : YES;
	[self.locationLabel sizeToFit];
    
}

- (CGFloat) contentHeight{
	
	if(!self.locationLabel.hidden && self.locationLabel.text.length > 0)
		return CGRectGetMaxY(self.locationLabel.frame) - 4;
	
	if(!self.titleLabel.hidden && self.titleLabel.text.length > 0)
		return CGRectGetMaxY(self.titleLabel.frame) - 4;
	return 0;
	
}

@end
