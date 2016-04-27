//
//  Number.h
//  AutoLayoutPractice
//
//  Created by iOess on 2/27/16.
//  Copyright (c) 2016 iOess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Number : UIView

@property (weak, nonatomic) IBOutlet UIView *background;

@property (weak, nonatomic) IBOutlet UIView *top;
@property (weak, nonatomic) IBOutlet UIView *middle;
@property (weak, nonatomic) IBOutlet UIView *bottom;
@property (weak, nonatomic) IBOutlet UIView *topLeft;
@property (weak, nonatomic) IBOutlet UIView *topRight;
@property (weak, nonatomic) IBOutlet UIView *bottomLeft;
@property (weak, nonatomic) IBOutlet UIView *bottomRight;


- (void)changeNumberColorTo:(id)color;
- (void) digitDisplayForTime:(int)digit;
- (void) digitDisplayForFirstHour:(int)digit;


@end
