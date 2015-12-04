//
//  SplunkObject.m
//  ICACrashReporter
//
//  Created by Jelle Vandebeeck on 03/12/15.
//  Copyright © 2015 Jelle Vandebeeck. All rights reserved.
//

#import <ICACrashReporter/Splunk.h>

#import "SplunkObject.h"

@implementation SplunkObject

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
    NSArray<ICACrashReporterProvider> *reporters = (NSArray<ICACrashReporterProvider> *) @[
                                                                                           [ICAConsoleCrashReporter new],
                                                                                           [ICASplunkCrashReporter new]
                                                                                           ];
    ICAMultiCrashReporter *provider = [[ICAMultiCrashReporter alloc] initWithReporters:reporters];
    [ICACrashReporter sharedInstance].provider = provider;
    
    // Run some reporting tools.
    [[ICACrashReporter sharedInstance] logBreadcrumb:[NSString stringWithFormat:@"KAWA %@", @"BUNGA"]];
    [[ICACrashReporter sharedInstance] logServiceFailureWithStatusCode:404 serviceURL:@"http://icapps.com" HTTPMethod:@"GET"];
    [ICACrashReporter sharedInstance].userIdentifier = @"User ID";
    [[ICACrashReporter sharedInstance] logEvent:@"An event"];
    [[ICACrashReporter sharedInstance] logKey:@"A" value:@"B"];
    
    // Log an exception.
    NSException *exception = [[NSException alloc] initWithName:@"BOOM" reason:@"Inconsistent design" userInfo:nil];
    [[ICACrashReporter sharedInstance] logException:exception];
    
    // Use the transaction controller.
    ICACrashReporterTransactionController *controller = [[ICACrashReporter sharedInstance] instantiateTransactionController];
    [controller start];
    [controller stop];
    [controller cancel];
}

@end
