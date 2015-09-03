//
//  ICASplunkCrashReporter.m
//  ICACrashReporter
//
//  Created by Pieterjan Vandegaer on 25/02/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import "ICASplunkCrashReporter.h"
#import "Mint.h"

@interface ICASplunkCrashReporter ()

@property (nonatomic, strong) NSString *key;

@end

@implementation ICASplunkCrashReporter

- (id)initWithKey:(NSString *)key {
    if (self = [super init]) {
        _key = key;
        [self startSession:key];
        
    }
    return self;
}

- (void)startSession:(NSString *)key {
    @try {
        [[Mint sharedInstance] initAndStartSession:key];
    }
    @catch (NSException *exception) {
        NSLog(@"Warning! Unable to initialize splunk with key %@.\nSplunk logging will not be active.", key);
    }
}

- (void)logBreadcrumb:(NSString *)breadcrumb {
    [[Mint sharedInstance] leaveBreadcrumb:breadcrumb];
}

- (void)logEvent:(NSString *)eventInfo {
    [[Mint sharedInstance] logEventAsyncWithTag:eventInfo completionBlock:nil];
}

- (void)logExtraData:(NSString *)key value:(NSString *)value {
    [[Mint sharedInstance] addExtraData:[[ExtraData alloc] initWithKey:key andValue:value]];
}

- (void)logException:(NSException *)exception {
    MintLogException(exception, nil);
}

- (void)setUserIdentifier:(NSString *)userId {
    [[Mint sharedInstance] setUserIdentifier:userId];
    [self startSession:self.key];
}

- (void)startTransaction:(NSString *)transactionId {
    [[Mint sharedInstance] transactionStart:transactionId andResultBlock:nil];
}

- (void)stopTransaction:(NSString *)transactionId {
    [[Mint sharedInstance] transactionStop:transactionId andResultBlock:nil];
}

- (void)cancelTransaction:(NSString *)transactionId {
    [[Mint sharedInstance] transactionCancel:transactionId reason:@"" andResultBlock:nil];
}

@end
