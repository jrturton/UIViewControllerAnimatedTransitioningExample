//
//  JRTDetailViewController.h
//  TransitionExample
//
//  Created by Vertical Turtle on 08/02/2014.
//  Copyright (c) 2014 Command Shift. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRTDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
