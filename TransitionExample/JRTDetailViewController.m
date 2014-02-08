//
//  JRTDetailViewController.m
//  TransitionExample
//
//  Created by Vertical Turtle on 08/02/2014.
//  Copyright (c) 2014 Command Shift. All rights reserved.
//

#import "JRTDetailViewController.h"

@interface JRTDetailViewController ()
- (void)configureView;
@end

@implementation JRTDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
