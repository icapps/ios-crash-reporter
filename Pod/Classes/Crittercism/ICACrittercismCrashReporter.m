//
//  ICACrittercismCrashReporter.m
//  Pods
//
//  Created by Hannes Van den Berghe on 03/05/16.
//
//

#import <Crittercism/Crittercism.h>

#import "ICACrittercismCrashReporter.h"

@interface ICACrittercismCrashReporter ()

@property (nonatomic, strong) NSString *key;

@end

@implementation ICACrittercismCrashReporter

#pragma mark - Init

- (instancetype)initWithKey:(NSString *)key {
    if (self = [super init]) {
        self.key = key;
        [self startCrittercismSession:self.key];
    }
    return self;
}

#pragma mark - ICACrashReporterProvider

- (void)logBreadcrumb:(NSString *)breadcrumb {
    [Crittercism leaveBreadcrumb:breadcrumb];
}

//- (void)logEvent:(NSString *)eventInfo {
//    //    [[Mint sharedInstance] logEventAsyncWithTag:eventInfo completionBlock:nil];
//}

- (void)logKey:(NSString *)key value:(NSString *)value {
    [Crittercism setValue:value forKey:key];
}

- (void)logException:(NSException *)exception {
    [Crittercism logHandledException:exception];
}

- (void)setUserIdentifier:(NSString *)userIdentifier {
    [Crittercism setUsername:userIdentifier];
    [self startCrittercismSession:self.key];
}

- (void)startTransaction:(NSString *)transactionID {
    [Crittercism beginUserflow:transactionID];
}

- (void)stopTransaction:(NSString *)transactionID {
    [Crittercism endUserflow:transactionID];
}

- (void)cancelTransaction:(NSString *)transactionID {
    [Crittercism cancelUserflow:transactionID];
}

#pragma mark - Crittercism

- (void)startCrittercismSession:(NSString *)key {
    @try {
        [Crittercism enableWithAppID:key];
    }
    @catch (NSException *exception) {
        NSLog(@"Warning! Unable to initialize Crittercism with key %@.\nCrittercism logging will not be active.", key);
    }
}

@end