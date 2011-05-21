//
//  Eat_NextAppDelegate.h
//  Eat Next
//
//  Created by Craig Ambrose on 15/05/11.
//  Copyright 2011 Craig Ambrose Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EatNextViewController;

@interface EatNextAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet EatNextViewController *viewController;

@end
