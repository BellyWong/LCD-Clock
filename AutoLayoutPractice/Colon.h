//
//  Colon.h
//  AutoLayoutPractice
//
//  Created by iOess on 3/2/16.
//  Copyright © 2016 iOess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Colon : UIView

@property (weak, nonatomic) IBOutlet UIView *background;

@property (weak, nonatomic) IBOutlet UIView *colonTop;
@property (weak, nonatomic) IBOutlet UIView *colonSpace;
@property (weak, nonatomic) IBOutlet UIView *colonBottom;

- (void)colonBlink;
- (void)updateColon;
- (void)changeColonColorTo:(id)color;

@end
