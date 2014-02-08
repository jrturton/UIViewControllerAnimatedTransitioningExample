//
//  JRTAnimationController.m
//  TransitionExample
//
//  Created by Vertical Turtle on 08/02/2014.
//  Copyright (c) 2014 Command Shift. All rights reserved.
//

#import "JRTAnimationController.h"
#import "JRTMasterViewController.h"
#import "JRTDetailViewController.h"
#import "JRTMasterCell.h"


@implementation JRTAnimationController

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    JRTMasterViewController* fromVC = (JRTMasterViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    JRTDetailViewController *toVC = (JRTDetailViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Create snapshot of the outgoing view.
    
    JRTMasterCell *cell = (JRTMasterCell*)[fromVC.tableView cellForRowAtIndexPath:[fromVC.tableView indexPathForSelectedRow]];
    UIView *label1Snapshot = [cell.label1 snapshotViewAfterScreenUpdates:NO];
    UIView *label2Snapshot = [cell.label2 snapshotViewAfterScreenUpdates:NO];
    UIView *label3Snapshot = [cell.label3 snapshotViewAfterScreenUpdates:NO];
    UIView *viewSnapshot = [cell.view snapshotViewAfterScreenUpdates:NO];
    
    UIView *outgoingSnapshot = [fromVC.view snapshotViewAfterScreenUpdates:YES];
    
    UIView *container = [transitionContext containerView];
    // Add the incoming view controller
    [container addSubview:toVC.view];
    
    // Build the animation canvas
    UIView *canvas = [[UIView alloc] initWithFrame:container.bounds];
    canvas.backgroundColor = [UIColor whiteColor];
    [container addSubview:canvas];
    
    [canvas addSubview:outgoingSnapshot];
    [canvas addSubview:label1Snapshot];
    [canvas addSubview:label2Snapshot];
    [canvas addSubview:label3Snapshot];
    [canvas addSubview:viewSnapshot];
    
    // Set the initial frames of the views we're animating
    label1Snapshot.frame = [container convertRect:cell.label1.bounds fromView:cell.label1];
    label2Snapshot.frame = [container convertRect:cell.label2.bounds fromView:cell.label2];
    label3Snapshot.frame = [container convertRect:cell.label3.bounds fromView:cell.label3];
    viewSnapshot.frame = [container convertRect:cell.view.bounds fromView:cell.view];
    
    [UIView animateWithDuration:0.25 animations:^{
        outgoingSnapshot.alpha = 0.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.75 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.0 options:0 animations:^{
            label1Snapshot.center = toVC.label1.center;
            label2Snapshot.center = toVC.label2.center;
            label3Snapshot.center = toVC.label3.center;
            viewSnapshot.center = toVC.redView.center;
            viewSnapshot.transform = CGAffineTransformMakeScale(toVC.redView.bounds.size.width / viewSnapshot.bounds.size.width , toVC.redView.bounds.size.height / viewSnapshot.bounds.size.height);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            [canvas removeFromSuperview];

        }];
    }];
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}
@end
