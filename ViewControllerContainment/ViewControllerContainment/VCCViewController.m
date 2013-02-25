//
//  VCCViewController.m
//  ViewControllerContainment
//
//  Created by Wojtek Nagrodzki on 19/02/2013.
//  Copyright (c) 2013 Wojtek Nagrodzki. All rights reserved.
//

#import "VCCViewController.h"
#import "VCCAutomaticCallbacksViewController.h"
#import "VCCManualCallbacksViewController.h"


@implementation VCCViewController

#pragma mark - Public Properties
#pragma mark - Class Methods
#pragma mark - Instance Methods
#pragma mark - IBActions

- (IBAction)automaticCallbacksTapped:(id)sender
{
    VCCAutomaticCallbacksViewController * controller = [[VCCAutomaticCallbacksViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)manualCallbacksTapped:(id)sender
{
    VCCManualCallbacksViewController * controller = [[VCCManualCallbacksViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - Overriden
#pragma mark - Private Properties
#pragma mark - Private Methods
#pragma mark - OtherPerfectClassDelegate
#pragma mark - Notifications

@end
