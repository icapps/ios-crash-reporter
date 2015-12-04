//
//  ICASplunkCrashReporter.m
//  ICACrashReporter
//
//  Created by Pieterjan Vandegaer on 25/02/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import <SplunkMint/Mint.h>

#import "ICASplunkCrashReporter.h"

@interface ICASplunkCrashReporter ()

@property (nonatomic, strong) NSString *key;

@end

@implementation ICASplunkCrashReporter

#pragma mark - Init

- (instancetype)initWithKey:(NSString *)key {
    if (self = [super init]) {
        self.key = key;
        [self startSplunkSession:self.key];
    }
    return self;
}

#pragma mark - ICACrashReporterProvider

- (void)logBreadcrumb:(NSString *)breadcrumb {
    [[Mint sharedInstance] leaveBreadcrumb:breadcrumb];
}

- (void)logEvent:(NSString *)eventInfo {
    [[Mint sharedInstance] logEventAsyncWithTag:eventInfo completionBlock:nil];
}

- (void)logKey:(NSString *)key value:(NSString *)value {
    [[Mint sharedInstance] addExtraData:[[ExtraData alloc] initWithKey:key andValue:value]];
}

- (void)logException:(NSException *)exception {
    MintLogException(exception, nil);
}

- (void)setUserIdentifier:(NSString *)userIdentifier {
    [[Mint sharedInstance] setUserIdentifier:userIdentifier];
    [self startSplunkSession:self.key];
}

- (void)startTransaction:(NSString *)transactionID {
    [[Mint sharedInstance] transactionStart:transactionID andResultBlock:nil];
}

- (void)stopTransaction:(NSString *)transactionID {
    [[Mint sharedInstance] transactionStop:transactionID andResultBlock:nil];
}

- (void)cancelTransaction:(NSString *)transactionID {
    [[Mint sharedInstance] transactionCancel:transactionID reason:@"" andResultBlock:nil];
}

#pragma mark - Splunk

- (void)startSplunkSession:(NSString *)key {
    @try {
        [[Mint sharedInstance] initAndStartSession:key];
    }
    @catch (NSException *exception) {
        NSLog(@"Warning! Unable to initialize splunk with key %@.\nSplunk logging will not be active.", key);
    }
}

@end
