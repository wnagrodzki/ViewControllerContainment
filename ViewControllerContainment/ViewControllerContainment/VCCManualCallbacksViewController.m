//
//  VCCManualCallbacksViewController.m
//  ViewControllerContainment
//
//  Created by Wojtek Nagrodzki on 25/02/2013.
//  Copyright (c) 2013 Wojtek Nagrodzki. All rights reserved.
//

#import "VCCManualCallbacksViewController.h"

@interface VCCManualCallbacksViewController ()

@end

@implementation VCCManualCallbacksViewController

#pragma mark - Public Properties
#pragma mark - Class Methods
#pragma mark - Instance Methods
#pragma mark - IBActions
#pragma mark - Overriden

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"Manual";
    }
    return self;
}

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

#pragma mark - Private Properties
#pragma mark - Private Methods
#pragma mark - OtherPerfectClassDelegate
#pragma mark - Notifications

@end
