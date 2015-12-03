//
//  GoogleAnalyticsObject.m
//  ICACrashReporter
//
//  Created by Jelle Vandebeeck on 03/12/15.
//  Copyright © 2015 Jelle Vandebeeck. All rights reserved.
//

#import <ICACrashReporter/GoogleAnalytics.h>

#import "GoogleAnalyticsObject.h"

@implementation GoogleAnalyticsObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupCrashReporter];
    }
    return self;
}

#pragma mark - Setup

- (void)setupCrashReporter {
    // Setup the reporters.
    NSArray *reporters = @[
                           [ICAConsoleCrashReporter new],
                           [ICAGoogleAnalyticsCrashReporter new],
                           ];
    ICAMultiCrashReporter *multiReporter = [[ICAMultiCrashReporter alloc] initWithReporters:reporters];
    [ICACrashReporter initAndStartWithInstance:multiReporter];
    
    // Run some reporting tools.
    [ICACrashReporter logBreadcrumb:@"test %@ %f %@", @"x", 23.3, @"TEST"];
    [ICACrashReporter logServiceFailure:404 serviceUrl:@"http://icapps.com" httpMethod:@"GET"];
    [ICACrashReporter setUserIdentifier:@"user A"];
    [ICACrashReporter logEvent:@"new event"];
    [ICACrashReporter logExtraData:@"key" value:@"value"];
    [ICACrashReporter logException:[NSException exceptionWithName:@"new exception" reason:@"crashed" userInfo:nil]];
    
    // Try the transaction controller.
    ICACrashReporterTransactionController *controller = [ICACrashReporter transactionController];
    [controller startTransaction];
    [controller stopTransaction];
    [controller cancelTransaction];
}

@end
