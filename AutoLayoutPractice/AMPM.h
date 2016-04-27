//
//  AMPM.h
//  AutoLayoutPractice
//
//  Created by iOess on 3/2/16.
//  Copyright © 2016 iOess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMPM : UIView

@property (weak, nonatomic) IBOutlet UIView *background;

@property (weak, nonatomic) IBOutlet UIView *mLeft;
@property (weak, nonatomic) IBOutlet UIView *mTopLeft;
@property (weak, nonatomic) IBOutlet UIView *mMiddle;
@property (weak, nonatomic) IBOutlet UIView *mTopRight;
@property (weak, nonatomic) IBOutlet UIView *mRight;
@property (weak, nonatomic) IBOutlet UIView *aTopRight;
@property (weak, nonatomic) IBOutlet UIView *aTop;
@property (weak, nonatomic) IBOutlet UIView *aLeft;
@property (weak, nonatomic) IBOutlet UIView *aMiddle;
@property (weak, nonatomic) IBOutlet UIView *aBottomRight;

- (void)changeAMPMColorTo:(id)color;
- (void)hideAMPMAtHour:(int)hour;
- (void)updateAMPMAtHour:(int)hour;

@end
