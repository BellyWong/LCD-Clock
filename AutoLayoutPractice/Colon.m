//
//  Colon.m
//  AutoLayoutPractice
//
//  Created by iOess on 3/2/16.
//  Copyright © 2016 iOess. All rights reserved.
//

#import "Colon.h"

@implementation Colon

-(id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        UIView *view1 = [[[NSBundle mainBundle] loadNibNamed:@"Colon" owner:self options:nil]objectAtIndex:0];
        
        
        view1.frame = self.bounds;
        view1.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:view1];
    }
    return self;
}

// Make colon blink and hide space between dots in colon
- (void)colonBlink {
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateColon) userInfo:nil repeats:YES];
    [self.colonSpace setHidden:YES];
}

// Update colon: If the colon is hidden, unhide it; if the colon is visible, hide it
- (void)updateColon {
    if (self.colonTop.hidden == YES) {
        [self.colonTop setHidden:NO];
        [self.colonBottom setHidden:NO];
    } else {
        [self.colonTop setHidden:YES];
        [self.colonBottom setHidden:YES];
    }
}

- (void)changeColonColorTo:(id)color {
    [self.colonTop setBackgroundColor:color];
    [self.colonBottom setBackgroundColor:color];
}
@end