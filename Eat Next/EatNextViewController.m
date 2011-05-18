//
//  EatNextViewController.m
//  Eat Next
//
//  Created by Craig Ambrose on 15/05/11.
//  Copyright 2011 Craig Ambrose Ltd. All rights reserved.
//

#import "EatNextViewController.h"
#import "AddFoodViewController.h"

@implementation EatNextViewController

@synthesize popoverController;
@synthesize foodDataSource;

- (void)dealloc
{
    [addFoodButton release];
    [popoverController release];
    [foodTable release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    foodDataSource = [[EatThisWeekDataSource alloc] init];
    foodTable.dataSource = foodDataSource;
}

- (void)viewDidUnload
{
    [addFoodButton release]; addFoodButton = nil;
    [popoverController release]; popoverController = nil;
    [foodTable release]; foodTable = nil;
    [foodDataSource release]; foodDataSource = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (IBAction)addFoodClicked:(id)sender {
    AddFoodViewController* content = [[AddFoodViewController alloc] init];
    UIPopoverController* aPopover = [[UIPopoverController alloc]
                                     initWithContentViewController:content];
    [content release];
    
    self.popoverController = aPopover;
    [aPopover release];
    
    [self.popoverController setPopoverContentSize:CGSizeMake(320, 320)];
    [self.popoverController presentPopoverFromRect:addFoodButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];     
}


@end
