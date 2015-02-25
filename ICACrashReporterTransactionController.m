//
//  ICACrashReporterTransactionController.m
//  ICACrashReporter
//
//  Created by Pieterjan Vandegaer on 25/02/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import "ICACrashReporterTransactionController.h"

@interface ICACrashReporterTransactionController ()

@property (nonatomic, strong) NSString *transactionId;
@property (nonatomic, weak) id<ICACrashReporterProvider> instance;

@end

@implementation ICACrashReporterTransactionController

- (instancetype)init {
    @throw @"Should use initWithInstance instead";
}

- (instancetype)initWithInstance:(id<ICACrashReporterProvider>)instance {
    if (self = [super init]) {
        _instance = instance;
        _transactionId = [[NSUUID UUID] UUIDString];
    }
    return self;
}

- (void)startTransaction {
    [_instance startTransaction:self.transactionId];
}

- (void)stopTransaction {
    [_instance stopTransaction:self.transactionId];
}

- (void)cancelTransaction {
    [_instance cancelTransaction:self.transactionId];
}

@end
