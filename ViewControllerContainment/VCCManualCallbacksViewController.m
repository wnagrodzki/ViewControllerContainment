//
//  VCCManualCallbacksViewController.m
//  ViewControllerContainment
//
//  Created by Wojtek Nagrodzki on 25/02/2013.
//  Copyright (c) 2013 Wojtek Nagrodzki. All rights reserved.
//

#import "VCCManualCallbacksViewController.h"


@interface VCCManualCallbacksViewController () {
    UIViewController * _displayedController;
}

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end


@implementation VCCManualCallbacksViewController

#pragma mark - Public Properties

- (void)setViewControllers:(NSArray *)viewControllers
{
    _viewControllers = viewControllers;
    
    if (self.isViewLoaded == NO)
        return;
    
    NSParameterAssert(viewControllers.count == 3);
}

#pragma mark - Class Methods
#pragma mark - Instance Methods
#pragma mark - IBActions

- (IBAction)hideButtonTapped:(id)sender
{
    [self hideDisplayedViewController];
}

- (IBAction)redButtonTapped:(id)sender
{
    UIViewController * controller = self.viewControllers[0];
    [self cycleFromViewController:_displayedController toViewController:controller];
    _displayedController = controller;
}

- (IBAction)greenButtonTapped:(id)sender
{
    UIViewController * controller = self.viewControllers[1];
    [self cycleFromViewController:_displayedController toViewController:controller];
    _displayedController = controller;
}

- (IBAction)blueButtonTapped:(id)sender
{
    UIViewController * controller = self.viewControllers[2];
    [self cycleFromViewController:_displayedController toViewController:controller];
    _displayedController = controller;
}

#pragma mark - Overriden

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"Manual";
    }
    return self;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
    return NO;
}

#pragma mark - Overriden (Appearance Callbacks)

- (void)viewWillAppear:(BOOL)animated
{
    NGLogMessage();
    [super viewWillAppear:animated];
    [_displayedController beginAppearanceTransition:YES animated:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    NGLogMessage();
    [super viewDidAppear:animated];
    [_displayedController endAppearanceTransition];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NGLogMessage();
    [super viewWillDisappear:animated];
    [_displayedController beginAppearanceTransition:NO animated:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    NGLogMessage();
    [super viewDidDisappear:animated];
    [_displayedController endAppearanceTransition];
}

#pragma mark - Overriden (Rotation Callbacks)

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NGLogMessage();
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    NGLogMessage();
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NGLogMessage();
}

#pragma mark - Private Properties
#pragma mark - Private Methods

- (void)cycleFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    [fromViewController willMoveToParentViewController:nil];
    [fromViewController beginAppearanceTransition:NO animated:YES];
    
    [self addChildViewController:toViewController];
    toViewController.view.frame = self.containerView.bounds;
    toViewController.view.alpha = 0;
    [toViewController beginAppearanceTransition:YES animated:YES];
    [self.containerView addSubview:toViewController.view];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         fromViewController.view.alpha = 0;
                         toViewController.view.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         [toViewController didMoveToParentViewController:self];
                         [toViewController endAppearanceTransition];
                         
                         [fromViewController.view removeFromSuperview];
                         [fromViewController removeFromParentViewController];
                         [fromViewController endAppearanceTransition];
                     }];
}

- (void)hideDisplayedViewController
{
    if (_displayedController == nil)
        return;
    
    [_displayedController willMoveToParentViewController:nil];
    [_displayedController beginAppearanceTransition:NO animated:YES];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         _displayedController.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [_displayedController.view removeFromSuperview];
                         [_displayedController removeFromParentViewController];
                         [_displayedController endAppearanceTransition];
                         
                         _displayedController = nil;
                     }];
}

#pragma mark - OtherPerfectClassDelegate
#pragma mark - Notifications

@end
