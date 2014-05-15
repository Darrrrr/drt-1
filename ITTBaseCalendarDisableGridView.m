//
//  BaseCalendarDisableGridView.m
//  ZHJCalendar
//
//  Created by huajian zhou on 12-4-12.
//  Copyright (c) 2012年 itotemstudio. All rights reserved.
//

#import "ITTBaseCalendarDisableGridView.h"

@interface ITTBaseCalendarDisableGridView()

@property (retain, nonatomic) IBOutlet UIButton *gridButton;

@end

@implementation ITTBaseCalendarDisableGridView

@synthesize gridButton;

- (IBAction)onGridButtonTouched:(id)sender
{
//    if (_delegate && [_delegate respondsToSelector:@selector(calendarGridViewDidSelectGrid:)]) {
//        [_delegate calendarGridViewDidSelectGrid:self];
//    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(calendarGridViewDidSelectGrid:)]) {
        [_delegate ittCalendarGridViewDidSelectGrid:self];
    }
    
}

//- (void)awakeFromNib
//{
//    [super awakeFromNib];
//    self.gridButton.userInteractionEnabled = YES;
//}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
- (void)select
{
    self.selected = TRUE;
    self.gridButton.selected = TRUE;
     self.gridButton.userInteractionEnabled = FALSE;
}

- (void)deselect
{
    self.selected = FALSE;
    self.gridButton.selected = FALSE;
        self.gridButton.userInteractionEnabled = TRUE;
}

//- (void)layoutSubviews
//{
//    NSString *title = [NSString stringWithFormat:@"%d", [_calDay getDay]];
//    [self.gridButton setTitle:title forState:UIControlStateNormal];
//    self.gridButton.selected = self.selected;    
//}
- (void)layoutSubviews
{
    NSString *title = [NSString stringWithFormat:@"%d", [_calDay getDay]];
    if (_selectedEanable) {
        self.gridButton.selected = self.selected;
        [self.gridButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else {
        self.gridButton.selected = self.selected;
        [self.gridButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [self.gridButton setTitle:title forState:UIControlStateNormal];
}
- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    [self setNeedsLayout];
}

- (void)dealloc 
{
    [gridButton release];
    [super dealloc];
}
@end
