//
//  ViewController.h
//  AutoLayoutPractice
//
//  Created by iOess on 2/27/16.
//  Copyright (c) 2016 iOess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Number.h"
#import "AMPM.h"
#import "Colon.h"
#import "UIColor+clockColors.h"


@interface ViewController : UIViewController <NSCoding, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet Number *hourTens;
@property (weak, nonatomic) IBOutlet Number *hourOnes;
@property (weak, nonatomic) IBOutlet Colon *colon;
@property (weak, nonatomic) IBOutlet Number *minuteTens;
@property (weak, nonatomic) IBOutlet Number *minuteOnes;
@property (weak, nonatomic) IBOutlet Number *secondTens;
@property (weak, nonatomic) IBOutlet Number *secondOnes;
@property (weak, nonatomic) IBOutlet AMPM *ampm;

@property (weak, nonatomic) IBOutlet UIButton *twentyFourHourButton;
@property (weak, nonatomic) IBOutlet UIPickerView *timeZonePickerView;


- (IBAction)twentyFourHour:(id)sender;
- (IBAction)timeZones:(id)sender;

@end

