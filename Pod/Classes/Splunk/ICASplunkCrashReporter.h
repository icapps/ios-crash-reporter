//
//  ICASplunkCrashReporter.h
//  ICACrashReporter
//
//  Created by Pieterjan Vandegaer on 25/02/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICACrashReporterProvider.h"

@interface ICASplunkCrashReporter : NSObject <ICACrashReporterProvider>

- (id)initWithKey:(NSString *)key;

@end
