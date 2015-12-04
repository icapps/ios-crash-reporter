//
//  ICAConsoleCrashReporter.m
//  ICACrashReporter
//
//  Created by Pieterjan Vandegaer on 25/02/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import "ICAConsoleCrashReporter.h"

@implementation ICAConsoleCrashReporter

- (void)logBreadcrumb:(NSString *)breadcrumb {
    NSLog(@"Logging breadcrumb: %@", breadcrumb);
}

- (void)logEvent:(NSString *)event {
    NSLog(@"Logging event: %@", event);
}

- (void)logKey:(NSString *)key value:(NSString *)value {
    NSLog(@"Logging data: %@ - %@",key,value);
}

- (void)logException:(NSException *)exception {
    NSLog(@"Logging exception: %@", exception.description);
}

- (void)setUserIdentifier:(NSString *)userIdentifier {
    NSLog(@"Setting User Identifier: %@", userIdentifier);
}

- (void)startTransaction:(NSString *)transactionID {
    NSLog(@"Starting transaction with ID: %@", transactionID);
}

- (void)stopTransaction:(NSString *)transactionID {
    NSLog(@"Stopping transaction with ID: %@", transactionID);
}

- (void)cancelTransaction:(NSString *)transactionID {
    NSLog(@"Cancelling transaction with ID: %@", transactionID);
}

@end
