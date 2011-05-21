//
//  EatNextViewController.h
//  Eat Next
//
//  Created by Craig Ambrose on 15/05/11.
//  Copyright 2011 Craig Ambrose Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EatThisWeekDataSource.h"

@interface EatNextViewController : UIViewController {
    UIPopoverController   *popoverController;
    IBOutlet UIButton     *addFoodButton;
    IBOutlet UITableView  *foodTable;
    EatThisWeekDataSource *foodDataSource;
}
@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) EatThisWeekDataSource *foodDataSource;
- (IBAction)addFoodClicked:(id)sender;

@end
