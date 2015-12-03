//
//  SplunkException.h
//  Splunk-iOS
//
//  Created by G.Tas on 11/2/13.
//  Copyright (c) 2013 Splunk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface MintException : JSONModel

+ (MintException*) getSplunkException:(NSException*)exception architecture:(NSString*)architecture handled: (BOOL)isHandled;
+ (MintException*) getSplunkExceptionWithHandled: (BOOL)isHandled;

- (BOOL) isEqualToSplunkException: (MintException*)aSplunkException;

@property (nonatomic, strong) NSString* message;
@property (nonatomic, strong) NSMutableDictionary* backtrace;
@property (nonatomic, strong) NSString* occuredAt;
@property (nonatomic, strong) NSString* klass;
@property (nonatomic, strong) NSString* where;
@property (nonatomic, strong) NSString* tags;
@property (nonatomic, strong) NSString* breadcrumbs;
@property (nonatomic, assign) NSInteger handled;
@property (nonatomic, strong) NSString* errorHash;
@property (nonatomic, strong) NSString* threadCrashed;
@property (nonatomic, strong) NSString* signalCode;
@property (nonatomic, strong) NSString* signalName;
@property (nonatomic, strong) NSString* timestamp;
@property (nonatomic, strong) NSNumber* msFromStart;
@property (nonatomic, strong) NSString* appRunningState;

@end
