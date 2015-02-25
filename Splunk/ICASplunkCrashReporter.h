//
//  ICASplunkCrashReporter.h
//  ICACrashReporter
//
//  Created by Pieterjan Vandegaer on 25/02/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICACrashReporter.h"

@interface ICASplunkCrashReporter : NSObject <ICACrashReporterProvider>

- (void)initWithKey:(NSString *)key;
- (void)logBreadcrumb:(NSString *)breadcrumb;
- (void)logEvent:(NSString *)eventInfo;
- (void)logExtraData:(NSString *)key value:(NSString *)value;
- (void)logException:(NSException *)exception;

@end