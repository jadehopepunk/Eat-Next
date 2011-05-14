//
//  Eat_NextAppDelegate.h
//  Eat Next
//
//  Created by Craig Ambrose on 15/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Eat_NextViewController;

@interface Eat_NextAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Eat_NextViewController *viewController;

@end
