//
//  ICAMultiCrashReporter.m
//  ICACrashReporter
//
//  Created by Pieterjan Vandegaer on 25/02/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import "ICAMultiCrashReporter.h"

@interface ICAMultiCrashReporter ()

@property (nonatomic, strong) NSArray *reporters;

@end


@implementation ICAMultiCrashReporter

- (id)initWithReporters:(NSArray *)reporters {
    if (self = [super init]) {
        _reporters = reporters;
    }
    return self;
}

- (void)logBreadcrumb:(NSString *)breadcrumb {
    for (id<ICACrashReporterProvider> reporter in self.reporters) {
        [reporter logBreadcrumb:breadcrumb];
    }
}

- (void)logEvent:(NSString *)eventInfo {
    for (id<ICACrashReporterProvider> reporter in self.reporters) {
        [reporter logEvent:eventInfo];
    }
}

- (void)logExtraData:(NSString *)key value:(NSString *)value {
    for (id<ICACrashReporterProvider> reporter in self.reporters) {
        [reporter logExtraData:key value:value];
    }
}

- (void)logException:(NSException *)exception {
    for (id<ICACrashReporterProvider> reporter in self.reporters) {
        [reporter logException:exception];
    }
}

- (void)setUserIdentifier:(NSString *)userId {
    for (id<ICACrashReporterProvider> reporter in self.reporters) {
        [reporter setUserIdentifier:userId];
    }
}

- (void)startTransaction:(NSString *)transactionId {
    for (id<ICACrashReporterProvider> reporter in self.reporters) {
        [reporter startTransaction:transactionId];
    }
}

- (void)stopTransaction:(NSString *)transactionId {
    for (id<ICACrashReporterProvider> reporter in self.reporters) {
        [reporter stopTransaction:transactionId];
    }
}

- (void)cancelTransaction:(NSString *)transactionId {
    for (id<ICACrashReporterProvider> reporter in self.reporters) {
        [reporter cancelTransaction:transactionId];
    }
}
@end
