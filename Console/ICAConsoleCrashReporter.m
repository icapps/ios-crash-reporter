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

- (void)logEvent:(NSString *)eventInfo {
    NSLog(@"Logging event: %@", eventInfo);
}

- (void)logExtraData:(NSString *)key value:(NSString *)value {
    NSLog(@"Logging data: %@ - %@",key,value);
}

- (void)logException:(NSException *)exception {
    NSLog(@"Logging exception: %@", exception.description);
}

- (void)setUserIdentifier:(NSString *)userId {
    NSLog(@"Setting User Identifier: %@", userId);
}

- (void)startTransaction:(NSString *)transactionId {
    NSLog(@"Starting transaction with Id: %@", transactionId);
}

- (void)stopTransaction:(NSString *)transactionId {
    NSLog(@"Stopping transaction with Id: %@", transactionId);
}

- (void)cancelTransaction:(NSString *)transactionId {
    NSLog(@"Cancelling transaction with Id: %@", transactionId);
}

@end
