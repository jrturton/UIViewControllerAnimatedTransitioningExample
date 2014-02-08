//
//  JRTMasterViewController.m
//  TransitionExample
//
//  Created by Vertical Turtle on 08/02/2014.
//  Copyright (c) 2014 Command Shift. All rights reserved.
//

#import "JRTMasterViewController.h"
#import "JRTMasterCell.h"
#import "JRTDetailViewController.h"
#import "JRTAnimationController.h"

@interface JRTMasterViewController() <UINavigationControllerDelegate>

@end

@implementation JRTMasterViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.delegate = self;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JRTMasterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - UINavigationControllerDelegate

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush)
    {
        return [JRTAnimationController new];
    }
    return nil;
}

@end
