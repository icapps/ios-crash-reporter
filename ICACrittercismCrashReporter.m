//
//  ICACrittercismCrashReporter.m
//  Pods
//
//  Created by Hannes Van den Berghe on 03/05/16.
//
//

#import <Foundation/Foundation.h>
#import "ICACrashReporterProvider.h"

@interface ICACrittercismCrashReporter : NSObject <ICACrashReporterProvider>
-(instancetype)initWithKey:(NSString *)key;
@end