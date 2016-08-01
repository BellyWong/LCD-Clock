//
//  ViewController.m
//  AutoLayoutPractice
//
//  Created by iOess on 2/27/16.
//  Copyright (c) 2016 iOess. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()

@property (nonatomic) int seconds;
@property (nonatomic) int minutes;
@property (nonatomic) int hours;
@property (nonatomic) NSDate *now;
@property (nonatomic) NSCalendar *calendar;
@property (nonatomic) NSArray *pickerViewArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.colon colonBlink];
    
    // Track seconds
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateSeconds) userInfo:nil repeats:YES];
    
    // PickerView code
    self.timeZonePickerView.delegate = self;
    self.timeZonePickerView.dataSource = self;
    self.pickerViewArray = @[@"Tuam",@"Zadar",@"Chapel Hill",@"Da Nang",@"Ulaanbaatar"];
    [self.timeZonePickerView setHidden:YES];

    [self setSwipeGesture]; // Swipe gesture changes background color
    [self setLongPressGesture]; // Long press gesture changes font color
    
    // Retrieve user preferences from NSUserDefaults
    NSString *timeZone = [[NSUserDefaults standardUserDefaults] objectForKey:@"timeZonePreference"];
    [self findCurrentTimeWithTimeZone:timeZone];
    [self twentyFourHour:nil];
    
    [self retrieveBackgroundColor];
    [self retrieveFontColor];

}

#pragma mark - Gesture Methods

- (void)setSwipeGesture {
    
    UISwipeGestureRecognizer *swipeRecognizer;
    swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [swipeRecognizer setDirection:(UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionUp)];
    [[self view] addGestureRecognizer:swipeRecognizer];
}

- (void)setLongPressGesture {
    
    UILongPressGestureRecognizer *longPressRecognizer;
    longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressFrom:)];
    [[self view] addGestureRecognizer:longPressRecognizer];
}

#pragma mark - Color Methods

- (void)retrieveBackgroundColor {
    
    NSUInteger backgroundColorInteger = [[NSUserDefaults standardUserDefaults] integerForKey:@"backgroundColorPreference"];
    switch (backgroundColorInteger){
        case 0:
            [self changeBackgroundColorTo:[UIColor backgroundRed]];
            break;
        case 1:
            [self changeBackgroundColorTo:[UIColor blackColor]];
            break;
        case 2:
            [self changeBackgroundColorTo:[UIColor backgroundPurple]];
            break;
        case 3:
            [self changeBackgroundColorTo:[UIColor backgroundGreen]];
            break;
        case 4:
            [self changeBackgroundColorTo:[UIColor backgroundBlue]];
            break;
        default:
            break;
    }
}

- (void)retrieveFontColor {
    
    NSUInteger fontColorInteger = [[NSUserDefaults standardUserDefaults] integerForKey:@"fontColorPreference"];
    switch (fontColorInteger) {
        case 0:
            [self changeFontColorTo:[UIColor fontYellow]];
            break;
        case 1:
            [self changeFontColorTo:[UIColor fontPink]];
            break;
        case 2:
            [self changeFontColorTo:[UIColor fontPurple]];
            break;
        case 3:
            [self changeFontColorTo:[UIColor fontBlue]];
            break;
        case 4:
            [self changeFontColorTo:[UIColor fontGreen]];
            break;
        default:
            break;
    }
}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
    NSLog(@"Swipe received");
    NSUInteger backgroundInt = [[NSUserDefaults standardUserDefaults] integerForKey:@"backgroundColorPreference"];
    switch (backgroundInt) {
        case 0:
            [self changeBackgroundColorTo:[UIColor blackColor]];
            backgroundInt = 1;
            break;
        case 1:
            [self changeBackgroundColorTo:[UIColor backgroundPurple]];
            backgroundInt = 2;
            break;
        case 2:
            [self changeBackgroundColorTo:[UIColor backgroundGreen]];
            backgroundInt = 3;
            break;
        case 3:
            [self changeBackgroundColorTo:[UIColor backgroundBlue]];
            backgroundInt = 4;
            break;
        case 4:
            [self changeBackgroundColorTo:[UIColor backgroundRed]];
            backgroundInt = 0;
            break;
        default:
            break;
    }
    [[NSUserDefaults standardUserDefaults] setInteger:backgroundInt forKey:@"backgroundColorPreference"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)handleLongPressFrom:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"UIGestureRecognizerStateEnded");
    }
    else if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"UIGestureRecognizerStateBegan");
        NSLog(@"Long Press received");
        
        NSUInteger fontInt = [[NSUserDefaults standardUserDefaults] integerForKey:@"fontColorPreference"];
        switch (fontInt) {
            case 0:
                [self changeFontColorTo:[UIColor fontPink]];
                fontInt = 1;
                break;
            case 1:
                [self changeFontColorTo:[UIColor fontPurple]];
                fontInt = 2;
                break;
            case 2:
                [self changeFontColorTo:[UIColor fontBlue]];
                fontInt = 3;
                break;
            case 3:
                [self changeFontColorTo:[UIColor fontGreen]];
                fontInt = 4;
                break;
            case 4:
                [self changeFontColorTo:[UIColor fontYellow]];
                fontInt = 0;
                break;
            default:
                break;
        
        }
        [[NSUserDefaults standardUserDefaults] setInteger:fontInt forKey:@"fontColorPreference"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)changeBackgroundColorTo:(id)color {
    NSArray *backgrounds = @[self.view, self.hourTens.background, self.hourOnes.background, self.colon.background, self.minuteTens.background, self.minuteOnes.background, self.ampm.background, self.secondTens.background, self.secondOnes.background];
    
    for (UIView *view in backgrounds) {
        [view setBackgroundColor:color];
    }
}

- (void)changeFontColorTo:(id)color {
    NSArray *numberPositions = @[self.hourTens, self.hourOnes, self.minuteTens, self.minuteOnes, self.secondTens, self.secondOnes];
    for (Number *place in numberPositions) {
        [place changeNumberColorTo:color];
    }
    [self.ampm changeAMPMColorTo:color];
    [self.colon changeColonColorTo:color];
}


#pragma mark - Time Keeping Methods

// Keep track of the passing seconds
- (void)updateSeconds {
    if (self.seconds == 59) {
        self.seconds = 0;
        int second1 = self.seconds / 10;
        int second2 = self.seconds % 10;
        [self.secondTens digitDisplayForTime:second1];
        [self.secondOnes digitDisplayForTime:second2];
        [self updateMinutes];
    }
    else {
        self.seconds = self.seconds + 1;
        int second1 = self.seconds / 10;
        int second2 = self.seconds % 10;
        [self.secondTens digitDisplayForTime:second1];
        [self.secondOnes digitDisplayForTime:second2];
    }
}

// Update minutes after every minute
- (void)updateMinutes{
    if (self.minutes == 59) {
        self.minutes = 0;
        int minute1 = self.minutes / 10;
        int minute2 = self.minutes % 10;
        [self.minuteTens digitDisplayForTime:minute1];
        [self.minuteOnes digitDisplayForTime:minute2];
        [self updateHours];
    }
    else {
        self.minutes = self.minutes + 1;
        int minute1 = self.minutes / 10;
        int minute2 = self.minutes % 10;
        [self.minuteTens digitDisplayForTime:minute1];
        [self.minuteOnes digitDisplayForTime:minute2];
    }
}

// Update hours after every hour
- (void)updateHours{
    if (self.hours == 23) {
        self.hours = 0;
        int hour1 = self.hours / 10;
        int hour2 = self.hours % 10;
        [self.hourTens digitDisplayForFirstHour:hour1];
        [self.hourOnes digitDisplayForTime:hour2];
    }
    else {
        self.hours = self.hours + 1;
        int hour1 = self.hours / 10;
        int hour2 = self.hours % 10;
        [self.hourTens digitDisplayForFirstHour:hour1];
        [self.hourOnes digitDisplayForTime:hour2];
    }
    [self.ampm updateAMPMAtHour:self.hours];
}

// 24 Hour button changes hours to military time and adds AM/PM
- (IBAction)twentyFourHour:(id)sender {
    int twentyFourHour1 = self.hours / 10;
    int twentyFourHour2 = self.hours % 10;
    int hour1;
    int hour2;
    if (self.hours > 12) {
        hour1 = (self.hours - 12) / 10;
        hour2 = (self.hours - 12) % 10;
    } else {
        hour1 = self.hours / 10;
        hour2 = self.hours % 10;
    }
    
    if (self.ampm.aMiddle.hidden == NO) {
        [self.hourTens digitDisplayForTime:twentyFourHour1];
        [self.hourOnes digitDisplayForTime:twentyFourHour2];
        [self.twentyFourHourButton setTitle:@"12 Hour" forState:UIControlStateNormal];
    } else {
        if (hour1 == 0 && hour2 == 0){
            [self.hourTens digitDisplayForFirstHour:1];
            [self.hourOnes digitDisplayForTime:2];
        }
        else {
            [self.hourTens digitDisplayForFirstHour:hour1];
            [self.hourOnes digitDisplayForTime:hour2];
        }
        [self.twentyFourHourButton setTitle:@"24 Hour" forState:UIControlStateNormal];
    }
    [self.ampm hideAMPMAtHour:self.hours];
}


#pragma mark - Time Zone Methods

// Display and hide time zone menu
- (IBAction)timeZones:(id)sender {
    if (self.timeZonePickerView.hidden == YES) {
        [self.timeZonePickerView setHidden:NO];
    } else {
        [self.timeZonePickerView setHidden:YES];
    }
}

// Update time zone
- (void)findCurrentTimeWithTimeZone:(id)timeZone {
    // Find current time
    self.now = [NSDate date];
    self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [self.calendar setTimeZone:[NSTimeZone timeZoneWithName:timeZone]];
    
    NSCalendarUnit units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components= [self.calendar components:units fromDate:self.now];
    
    // Get time variables
    self.seconds = (int)[components second];
    self.minutes = (int)[components minute];
    self.hours = (int)[components hour];
    int hour1 = (self.hours - 12) / 10;
    int hour2 = (self.hours - 12) % 10;
    int minute1 = self.minutes / 10;
    int minute2 = self.minutes % 10;
    int second1 = self.seconds / 10;
    int second2 = self.seconds % 10;
    
    // Display numbers
    if (hour1 == 0 && hour2 == 0){
        [self.hourTens digitDisplayForFirstHour:1];
        [self.hourOnes digitDisplayForTime:2];
    }
    else {
        [self.hourTens digitDisplayForFirstHour:hour1];
        [self.hourOnes digitDisplayForTime:hour2];
    }
    [self.minuteTens digitDisplayForTime:minute1];
    [self.minuteOnes digitDisplayForTime:minute2];
    [self.secondTens digitDisplayForTime:second1];
    [self.secondOnes digitDisplayForTime:second2];
    [self.ampm updateAMPMAtHour:self.hours];
}


#pragma mark - Picker View Methods

// Change time to time zones from picker view
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *timeZone;
    switch (row) {
        case 0:
            timeZone = @"GMT";
            break;
        case 1:
            timeZone = @"GMT+1:00";
            break;
        case 2:
            timeZone = @"GMT-5:00";
            break;
        case 3:
            timeZone = @"GMT+7:00";
            break;
        case 4:
            timeZone = @"GMT+8:00";
            break;
        default:
            break;
    }
    [self findCurrentTimeWithTimeZone:timeZone];
    [[NSUserDefaults standardUserDefaults] setObject:timeZone forKey:@"timeZonePreference"];
    [self twentyFourHour:nil];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.pickerViewArray.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.pickerViewArray[row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
