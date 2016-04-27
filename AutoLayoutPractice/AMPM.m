//
//  AMPM.m
//  AutoLayoutPractice
//
//  Created by iOess on 3/2/16.
//  Copyright © 2016 iOess. All rights reserved.
//

#import "AMPM.h"

@interface AMPM()

@property (nonatomic) NSArray *ampmSegments;

@end

@implementation AMPM

-(id)initWithCoder:(NSCoder *)aDecoder{
    if ((self = [super initWithCoder:aDecoder])){
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"AMPM" owner:self options:nil]objectAtIndex:0];
        
        view.frame = self.bounds;
        view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:view];
        
        self.ampmSegments = @[self.aBottomRight, self.aTop, self.aTopRight, self.aLeft, self.aMiddle, self.mLeft, self.mMiddle, self.mRight, self.mTopLeft, self.mTopRight];
    }
    return self;
}

- (void)changeAMPMColorTo:(id)color {
    for (UIView *segment in self.ampmSegments) {
        [segment setBackgroundColor:color];
    }
}

// Hide AM/PM when in 24 hour time
- (void)hideAMPMAtHour:(int)hour {
    if (self.aMiddle.hidden == YES) {
        [self updateAMPMAtHour:hour];
    } else {
        for (UIView *segment in self.ampmSegments) {
            [segment setHidden:YES];
        }
    }
}

 //Update AMPM: Turn AM into PM after noon
- (void)updateAMPMAtHour:(int)hour {
    if (hour >= 12) {
        for (int i = 1; i < self.ampmSegments.count; i++) {
            UIView *segment = [self.ampmSegments objectAtIndex:i];
            [segment setHidden:NO];
        }
    } else {
        for (UIView *segment in self.ampmSegments) {
            [segment setHidden:NO];
        }
    }
}
    
@end
