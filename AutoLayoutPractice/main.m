//
//  main.m
//  AutoLayoutPractice
//
//  Created by iOess on 2/27/16.
//  Copyright (c) 2016 iOess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
        
        // 1. What is meant by archiving?
        // Archiving means to save information or settings so that when the app is opened later, it can be loaded into the application.
        
        
        // 2. Where is the data in NSUserDefaults stored? How can you look inside it?
        // ~/Library/Preferences/com.example.myapp.plist
        
        
        // 3. What kind of class version issue can you expect with object archiving?
        // NSUserDefaults can only take objects of type NSData, NSString, NSNumber, NSDate, NSArray, or NSDictionary so other object types may have to be changed somehow
        
    }
}
