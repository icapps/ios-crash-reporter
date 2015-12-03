//
//  UnhandledCrashExtra.h
//  Splunk-iOS
//
//  Created by George Taskos on 10/2/14.
//  Copyright (c) 2014 SLK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface UnhandledCrashExtra : JSONModel

@property (nonatomic, strong) NSString* appVersionCode;
@property (nonatomic, strong) NSString* appVersionName;
@property (nonatomic, strong) NSString* connection;
@property (nonatomic, strong) NSString* state;
@property (nonatomic, strong) NSDate* sessionStartDate;
@property (nonatomic, strong) NSNumber<Ignore>* msFromStart;
@property (nonatomic, strong) NSArray<Ignore>* breadcrumbs;
@property (nonatomic, strong) NSArray<Ignore>* extraData;
@property (nonatomic, strong) UnhandledCrashExtra<Ignore>* latestUnhandledCrashExtra;

+ (instancetype) sharedInstance;
+ (void) crashReportDate:(NSDate*)crashDate;
- (UnhandledCrashExtra*) loadUnhandledCrashExtra;
- (void) loadLatestUnhandledExtraData;
- (void) saveUnhandledCrashExtra;

@end
