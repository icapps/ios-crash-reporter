//
//  ICASplunkCrashReporter.m
//  ICACrashReporter
//
//  Created by Pieterjan Vandegaer on 25/02/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import "ICASplunkCrashReporter.h"
#import <SplunkMint-iOS/SplunkMint-iOS.h>

@interface ICASplunkCrashReporter ()

@property (nonatomic, strong) NSString *key;

@end

@implementation ICASplunkCrashReporter

- (id)initWithKey:(NSString *)key {
    if (self = [super init]) {
        _key = key;
        [[Mint sharedInstance] initAndStartSession:key];
    }
    return self;
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
    [[Mint sharedInstance] initAndStartSession:self.key];
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
