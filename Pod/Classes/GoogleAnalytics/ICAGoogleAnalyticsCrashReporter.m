//
//  ICAGoogleAnalyticsCrashReporter.m
//  ICACrashReporter
//
//  Created by Nicolas Rahoens on 5/05/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import "GAI.h"
#import "GAITracker.h"
#import "GAIDictionaryBuilder.h"

#import "ICAGoogleAnalyticsCrashReporter.h"

@interface ICAGoogleAnalyticsCrashReporter()

@property (nonatomic, strong) id<GAITracker> tracker;

@end

@implementation ICAGoogleAnalyticsCrashReporter

#pragma mark - Init

- (instancetype)initWithKey:(NSString *)key {
    if (self = [super init]) {
        self.tracker = [[GAI sharedInstance] trackerWithTrackingId:key];
    }
    return self;
}

#pragma mark - ICACrashReporterProvider

- (void)logBreadcrumb:(NSString *)breadcrumb {
    [self sendToGoogleAnalyticsWithCategory:@"breadcrumb" action:breadcrumb];
}

- (void)logEvent:(NSString *)event {
    [self sendToGoogleAnalyticsWithCategory:@"event" action:event];
}

- (void)logKey:(NSString *)key value:(NSString *)value {
    [self sendToGoogleAnalyticsWithCategory:key action:value];
}

- (void)logException:(NSException *)exception {
    [self.tracker send:[[GAIDictionaryBuilder createExceptionWithDescription:exception.debugDescription withFatal:@NO] build]];
}

- (void)setUserIdentifier:(NSString *)userIdentifier {
    [self.tracker set:@"&uid" value:userIdentifier];
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"UX" action:@"User Signed In" label:nil value:nil] build]];
}

- (void)startTransaction:(NSString *)transactionID {
    [[GAI sharedInstance] dispatch];
}

- (void)stopTransaction:(NSString *)transactionID {
    // Not supported
}

- (void)cancelTransaction:(NSString *)transactionID {
    // Not supported
}

#pragma mark - Google Analytics

- (void)sendToGoogleAnalyticsWithCategory:(NSString *)category action:(NSString *)action {
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:category action:action label:@"" value:nil] build]];
}

@end
