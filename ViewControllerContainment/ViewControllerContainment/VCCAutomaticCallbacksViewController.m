//
//  VCCAutomaticCallbacksViewController.m
//  ViewControllerContainment
//
//  Created by Wojtek Nagrodzki on 25/02/2013.
//  Copyright (c) 2013 Wojtek Nagrodzki. All rights reserved.
//

#import "VCCAutomaticCallbacksViewController.h"


@interface VCCAutomaticCallbacksViewController () {
    UIViewController * _displayedController;
}

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end


@implementation VCCAutomaticCallbacksViewController

#pragma mark - Public Properties

- (void)setViewControllers:(NSArray *)viewControllers
{
    _viewControllers = viewControllers;
    
    if (self.isViewLoaded == NO)
        return;
    
    if (self.viewControllers.count == 0)
        return;
    
    [self displayViewController:viewControllers[0]];
}

#pragma mark - Class Methods
#pragma mark - Instance Methods
#pragma mark - IBActions

- (IBAction)previousButtonTapped:(id)sender
{
    NSUInteger index = [self.viewControllers indexOfObject:_displayedController];
    if (index == 0)
        return;
    
    UIViewController * previousViewController = self.viewControllers[index - 1];
    [self cycleFromViewController:_displayedController toViewController:previousViewController forward:NO];
    _displayedController = previousViewController;
}

- (IBAction)nextButtonTapped:(id)sender
{
    NSUInteger index = [self.viewControllers indexOfObject:_displayedController];
    if (index == self.viewControllers.count - 1)
        return;

    UIViewController * nextViewController = self.viewControllers[index + 1];
    [self cycleFromViewController:_displayedController toViewController:nextViewController forward:YES];
    _displayedController = nextViewController;
}

#pragma mark - Overriden

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"Automatic";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (self.viewControllers.count)
        [self displayViewController:self.viewControllers[0]];
}

#pragma mark - Overriden (Appearanca Callbacks)

- (void)viewWillAppear:(BOOL)animated
{
    NGLogMessage();
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    NGLogMessage();
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NGLogMessage();
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    NGLogMessage();
    [super viewDidDisappear:animated];
}

#pragma mark - Private Properties
#pragma mark - Private Methods

- (void)cycleFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController forward:(BOOL)forward
{
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    CGRect frame = self.containerView.bounds;
    frame.origin.x = forward ? frame.size.width : -frame.size.width;
    toViewController.view.frame = frame;
    
    [self transitionFromViewController:fromViewController
                      toViewController:toViewController
                              duration:0.3
                               options:UIViewAnimationOptionCurveEaseInOut
                            animations:^{
                                CGRect frame = self.containerView.bounds;
                                frame.origin.x = forward ? -frame.size.width : frame.size.width;
                                fromViewController.view.frame = frame;
                                
                                toViewController.view.frame = self.containerView.bounds;
                            }
                            completion:^(BOOL finished) {
                                [toViewController didMoveToParentViewController:self];
                                [fromViewController removeFromParentViewController];
                            }];

}

- (void)displayViewController:(UIViewController *)controller
{
    [_displayedController willMoveToParentViewController:nil];
    [_displayedController.view removeFromSuperview];
    [_displayedController removeFromParentViewController];
    
    _displayedController = controller;
    
    [self addChildViewController:controller];
    controller.view.frame = self.containerView.bounds;
    [self.containerView addSubview:controller.view];
    [controller didMoveToParentViewController:self];
}

#pragma mark - OtherPerfectClassDelegate
#pragma mark - Notifications

@end
