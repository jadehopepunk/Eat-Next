//
//  Eat_NextViewController.h
//  Eat Next
//
//  Created by Craig Ambrose on 15/05/11.
//  Copyright 2011 Craig Ambrose Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Eat_NextViewController : UIViewController {
    UIPopoverController *popoverController;
    IBOutlet UIButton *addFoodButton;
}
@property (nonatomic, retain) UIPopoverController *popoverController;
- (IBAction)addFoodClicked:(id)sender;

@end
