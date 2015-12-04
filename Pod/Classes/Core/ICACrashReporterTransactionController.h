//
//  ICACrashReporterTransactionController.h
//  ICACrashReporter
//
//  Created by Pieterjan Vandegaer on 25/02/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICACrashReporter.h"

@interface ICACrashReporterTransactionController : NSObject

- (instancetype)initWithProvider:(id<ICACrashReporterProvider>)provider;

- (void)start;
- (void)stop;
- (void)cancel;

@end
