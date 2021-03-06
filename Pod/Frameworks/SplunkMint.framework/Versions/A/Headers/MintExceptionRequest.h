//
//  SplunkExceptionRequest.h
//  Splunk-iOS
//
//  Created by G.Tas on 11/7/13.
//  Copyright (c) 2013 Splunk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MintException.h"
#import "MintAppEnvironment.h"
#import "MintClient.h"
#import "MintPerformance.h"
#import "MintInternalRequest.h"
#import "LimitedExtraDataList.h"
#import "JSONModel.h"
#import "ExtraData.h"

@protocol CrashExtraData <NSObject>
@end

@interface MintExceptionRequest : JSONModel


- (id) initWithException: (MintException*)anException environment: (MintAppEnvironment*)anEnvironment performance: (MintPerformance*)aPerformance andLimitedCrashExtraData: (LimitedExtraDataList*)aLimitedCrashExtraData;
- (BOOL) isEqualToSplunkExceptionRequest: (MintExceptionRequest*)aSplunkExceptionRequest;

@property (nonatomic, strong) NSMutableDictionary<Ignore>* log_data;
@property (nonatomic, strong) MintException* exception;
@property (nonatomic, strong) MintAppEnvironment* application_environment;
@property (nonatomic, strong) MintClient* client;
@property (nonatomic, strong) MintPerformance* performance;
@property (nonatomic, strong) MintInternalRequest<Optional>* request;
@property (nonatomic, strong) NSString<Ignore>* crashReportAscii;

@end
