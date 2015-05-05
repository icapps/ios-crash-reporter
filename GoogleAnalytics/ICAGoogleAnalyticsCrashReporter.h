//
//  ICAGoogleAnalyticsCrashReporter.h
//  ICACrashReporter
//
//  Created by Nicolas Rahoens on 5/05/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICACrashReporter.h"

@interface ICAGoogleAnalyticsCrashReporter : NSObject <ICACrashReporterProvider>

- (instancetype)initWithKey:(NSString *)key;

- (void)logBreadcrumb:(NSString *)breadcrumb;
- (void)logEvent:(NSString *)eventInfo;
- (void)logExtraData:(NSString *)key value:(NSString *)value;
- (void)logException:(NSException *)exception;
- (void)setUserIdentifier:(NSString *)userId;
- (void)startTransaction:(NSString *)transactionId;
- (void)stopTransaction:(NSString *)transactionId;
- (void)cancelTransaction:(NSString *)transactionId;

@end
