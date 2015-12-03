//
//  CoreObject.m
//  ICACrashReporter
//
//  Created by Jelle Vandebeeck on 03/12/15.
//  Copyright © 2015 Jelle Vandebeeck. All rights reserved.
//

#import <ICACrashReporter/Core.h>

#import "CoreObject.h"

@implementation CoreObject

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
                           [ICAConsoleCrashReporter new]
                           ];
    ICAMultiCrashReporter *multiReporter = [[ICAMultiCrashReporter alloc] initWithReporters:reporters];
    [ICACrashReporter initAndStartWithInstance:multiReporter];
    
    // Run some reporting tools.
    [ICACrashReporter logBreadcrumb:[NSString stringWithFormat:@"KAWA %@", @"BUNGA"]];
    [ICACrashReporter logServiceFailure:404 serviceUrl:@"http://icapps.com" httpMethod:@"GET"];
    [ICACrashReporter setUserIdentifier:@"123"];
    [ICACrashReporter logEvent:@"BOOM!"];
    [ICACrashReporter logExtraData:@"a" value:@"b"];
    [ICACrashReporter logException:[NSException exceptionWithName:@"BOOM" reason:@"Inconsistent design" userInfo:nil]];
    
    // Try the transaction controller.
    ICACrashReporterTransactionController *controller = [ICACrashReporter transactionController];
    [controller startTransaction];
    [controller stopTransaction];
    [controller cancelTransaction];
}

@end
