//
//  Number.m
//  AutoLayoutPractice
//
//  Created by iOess on 2/27/16.
//  Copyright (c) 2016 iOess. All rights reserved.
//

#import "Number.h"

@implementation Number

-(id)initWithCoder:(NSCoder *)aDecoder{
    if ((self = [super initWithCoder:aDecoder])){
        UIView *view1 = [[[NSBundle mainBundle] loadNibNamed:@"Number" owner:self options:nil]objectAtIndex:0];
        
        view1.frame = self.bounds;
        view1.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:view1];
    }
    return self;
}

- (void)changeNumberColorTo:(id)color {
    NSArray *segments = @[self.topLeft, self.top, self.topRight, self.middle, self.bottomLeft, self.bottom, self.bottomRight];
    for(UIView *segment in segments) {
            [segment setBackgroundColor:color];
    }
}

// First hour digit: when in 12 hour time, make zero hidden
- (void) digitDisplayForFirstHour:(int)digit {
    switch (digit) {
        case 0:
            [self.middle setHidden:YES];
            [self.topLeft setHidden:YES];
            [self.top setHidden:YES];
            [self.bottomLeft setHidden:YES];
            [self.bottom setHidden:YES];
            [self.topRight setHidden:YES];
            [self.bottomRight setHidden:YES];
            break;
        case 1:
            [self.topLeft setHidden:YES];
            [self.top setHidden:YES];
            [self.middle setHidden:YES];
            [self.bottomLeft setHidden:YES];
            [self.bottom setHidden:YES];
            [self.topRight setHidden:NO];
            [self.bottomRight setHidden:NO];
            break;
        case 2:
            [self.topLeft setHidden:YES];
            [self.bottomRight setHidden:YES];
            [self.top setHidden:NO];
            [self.bottomLeft setHidden:NO];
            [self.bottom setHidden:NO];
            [self.topRight setHidden:NO];
            [self.middle setHidden:NO];
            break;
        default:
            break;
    }
}

// Display digits: show/hide appropriate segments to represent the number
- (void) digitDisplayForTime:(int)digit {
    switch (digit) {
        case 0:
            [self.middle setHidden:YES];
            [self.topLeft setHidden:NO];
            [self.top setHidden:NO];
            [self.bottomLeft setHidden:NO];
            [self.bottom setHidden:NO];
            [self.topRight setHidden:NO];
            [self.bottomRight setHidden:NO];
            break;
        case 1:
            [self.topLeft setHidden:YES];
            [self.top setHidden:YES];
            [self.middle setHidden:YES];
            [self.bottomLeft setHidden:YES];
            [self.bottom setHidden:YES];
            [self.topRight setHidden:NO];
            [self.bottomRight setHidden:NO];
            break;
        case 2:
            [self.topLeft setHidden:YES];
            [self.bottomRight setHidden:YES];
            [self.top setHidden:NO];
            [self.bottomLeft setHidden:NO];
            [self.bottom setHidden:NO];
            [self.topRight setHidden:NO];
            [self.middle setHidden:NO];
            break;
        case 3:
            [self.topLeft setHidden:YES];
            [self.bottomLeft setHidden:YES];
            [self.top setHidden:NO];
            [self.bottom setHidden:NO];
            [self.topRight setHidden:NO];
            [self.bottomRight setHidden:NO];
            [self.middle setHidden:NO];
            break;
        case 4:
            [self.top setHidden:YES];
            [self.bottomLeft setHidden:YES];
            [self.bottom setHidden:YES];
            [self.topLeft setHidden:NO];
            [self.bottomRight setHidden:NO];
            [self.topRight setHidden:NO];
            [self.middle setHidden:NO];
            break;
        case 5:
            [self.topRight setHidden:YES];
            [self.bottomLeft setHidden:YES];
            [self.top setHidden:NO];
            [self.bottom setHidden:NO];
            [self.topLeft setHidden:NO];
            [self.bottomRight setHidden:NO];
            [self.middle setHidden:NO];
            break;
        case 6:
            [self.topRight setHidden:YES];
            [self.bottomLeft setHidden:NO];
            [self.top setHidden:NO];
            [self.bottom setHidden:NO];
            [self.topLeft setHidden:NO];
            [self.bottomRight setHidden:NO];
            [self.middle setHidden:NO];
            break;
        case 7:
            [self.topLeft setHidden:YES];
            [self.middle setHidden:YES];
            [self.bottomLeft setHidden:YES];
            [self.bottom setHidden:YES];
            [self.topRight setHidden:NO];
            [self.top setHidden:NO];
            [self.bottomRight setHidden:NO];
            break;
        case 8:
            [self.bottomLeft setHidden:NO];
            [self.topLeft setHidden:NO];
            [self.middle setHidden:NO];
            [self.bottom setHidden:NO];
            [self.topRight setHidden:NO];
            [self.top setHidden:NO];
            [self.bottomRight setHidden:NO];
            break;
        case 9:
            [self.bottomLeft setHidden:YES];
            [self.topLeft setHidden:NO];
            [self.middle setHidden:NO];
            [self.bottom setHidden:NO];
            [self.topRight setHidden:NO];
            [self.top setHidden:NO];
            [self.bottomRight setHidden:NO];
            break;
        default:
            break;
    }
}

@end
