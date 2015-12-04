//
//  ICACrashReporterTransactionController.m
//  ICACrashReporter
//
//  Created by Pieterjan Vandegaer on 25/02/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import "ICACrashReporterTransactionController.h"

@interface ICACrashReporterTransactionController ()

@property (nonatomic, strong) NSString *transactionID;
@property (nonatomic, weak) id<ICACrashReporterProvider> provider;

@end

@implementation ICACrashReporterTransactionController

#pragma mark - Init

- (instancetype)init {
    @throw @"Should be initialized with a provider.";
}

- (instancetype)initWithProvider:(id<ICACrashReporterProvider>)provider {
    if (self = [super init]) {
        self.provider = provider;
        self.transactionID = [[NSUUID UUID] UUIDString];
    }
    return self;
}

#pragma mark - Action

- (void)start {
    [self.provider startTransaction:self.transactionID];
}

- (void)stop {
    [self.provider stopTransaction:self.transactionID];
}

- (void)cancel {
    [self.provider cancelTransaction:self.transactionID];
}

@end
