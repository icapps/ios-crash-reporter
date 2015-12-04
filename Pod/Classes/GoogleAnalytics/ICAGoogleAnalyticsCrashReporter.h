//
//  ICAGoogleAnalyticsCrashReporter.h
//  ICACrashReporter
//
//  Created by Nicolas Rahoens on 5/05/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICACrashReporterProvider.h"

@interface ICAGoogleAnalyticsCrashReporter : NSObject <ICACrashReporterProvider>

- (instancetype)initWithKey:(NSString *)key;

@end
