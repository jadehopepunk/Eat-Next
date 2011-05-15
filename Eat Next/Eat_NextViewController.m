//
//  Eat_NextViewController.m
//  Eat Next
//
//  Created by Craig Ambrose on 15/05/11.
//  Copyright 2011 Craig Ambrose Ltd. All rights reserved.
//

#import "Eat_NextViewController.h"
#import "AddFoodViewController.h"

@implementation Eat_NextViewController

@synthesize popoverController;

- (void)dealloc
{
    [addFoodButton release];
    [popoverController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [addFoodButton release];
    addFoodButton = nil;
    [popoverController release];
    popoverController = nil;
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
    NSLog(@"add food button pressed");
    
    AddFoodViewController* content = [[AddFoodViewController alloc] init];
    UIPopoverController* aPopover = [[UIPopoverController alloc]
                                     initWithContentViewController:content];
//    aPopover.delegate = self;
    [content release];
    
    // Store the popover in a custom property for later use.
    self.popoverController = aPopover;
    [aPopover release];
    
    [self.popoverController setPopoverContentSize:CGSizeMake(320, 320)];
    [self.popoverController presentPopoverFromRect:addFoodButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES]; 
    
}
@end
