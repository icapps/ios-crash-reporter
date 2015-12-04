//
//  ICAMultiCrashReporter.h
//  ICACrashReporter
//
//  Created by Pieterjan Vandegaer on 25/02/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICACrashReporter.h"

@interface ICAMultiCrashReporter : NSObject <ICACrashReporterProvider>

- (id)initWithReporters:(NSArray<ICACrashReporterProvider> *)reporters;

@end
