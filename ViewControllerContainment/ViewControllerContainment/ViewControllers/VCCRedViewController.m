//
//  VCCRedViewController.m
//  ViewControllerContainment
//
//  Created by Wojtek Nagrodzki on 11/04/2013.
//  Copyright (c) 2013 Wojtek Nagrodzki. All rights reserved.
//

#import "VCCRedViewController.h"

@interface VCCRedViewController ()

@end

@implementation VCCRedViewController

#pragma mark - Overriden (Appearanca Callbacks)

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NGLogMessage();
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NGLogMessage();
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NGLogMessage();
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NGLogMessage();
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

@end
