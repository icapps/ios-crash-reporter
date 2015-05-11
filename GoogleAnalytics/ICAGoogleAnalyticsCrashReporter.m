//
//  ICAGoogleAnalyticsCrashReporter.m
//  ICACrashReporter
//
//  Created by Nicolas Rahoens on 5/05/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import "ICAGoogleAnalyticsCrashReporter.h"
#import <GoogleAnalytics-iOS-SDK/GAI.h>
#import <GoogleAnalytics-iOS-SDK/GAIDictionaryBuilder.h>

@interface ICAGoogleAnalyticsCrashReporter()

@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) id<GAITracker> tracker;

@end

@implementation ICAGoogleAnalyticsCrashReporter

- (instancetype)initWithKey:(NSString *)key {
    if (self = [super init]) {
        _key = key;
        _tracker = [[GAI sharedInstance] trackerWithTrackingId:key];
    }
    return self;
}

- (void)logBreadcrumb:(NSString *)breadcrumb {
    [self logGoogleAnalyticsCategory:@"breadcrumb" action:breadcrumb];
}

- (void)logEvent:(NSString *)eventInfo {
    [self logGoogleAnalyticsCategory:@"event" action:eventInfo];
}

- (void)logGoogleAnalyticsCategory:(NSString *)category action:(NSString *)action {
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:category
                                                               action:action
                                                                label:@""
                                                                value:nil] build]];
}

- (void)logExtraData:(NSString *)key value:(NSString *)value {
    [self logGoogleAnalyticsCategory:key action:value];
}

- (void)logException:(NSException *)exception {
    [self.tracker send:[[GAIDictionaryBuilder createExceptionWithDescription:exception.debugDescription withFatal:@NO] build]];
}

- (void)setUserIdentifier:(NSString *)userId {
    [self.tracker set:@"&uid" value:userId];
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"UX" action:@"User Signed In" label:nil value:nil] build]];
}

- (void)startTransaction:(NSString *)transactionId {
    [[GAI sharedInstance] dispatch];
}

- (void)stopTransaction:(NSString *)transactionId {
    // Not supported
}

- (void)cancelTransaction:(NSString *)transactionId {
    // Not supported
}

@end
