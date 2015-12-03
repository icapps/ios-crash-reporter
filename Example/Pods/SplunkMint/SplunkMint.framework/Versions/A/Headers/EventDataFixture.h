//
//  EventDataFixture.h
//  Splunk-iOS
//
//  Created by G.Tas on 11/6/13.
//  Copyright (c) 2013 Splunk. All rights reserved.
//

#import "DataFixture.h"
#import "MintAppEnvironment.h"
#import "MintEnums.h"
#import "LimitedExtraDataList.h"

@interface EventDataFixture : DataFixture

@property (nonatomic, strong) NSString<Optional>* name;
@property (nonatomic, strong) NSNumber<Optional>* level;

+ (EventDataFixture*) getInstanceForEventTag:(NSString*)eventTag andAppEnvironment:(MintAppEnvironment*)anAppEnvironment;
+ (EventDataFixture*) getInstanceForEventTag:(NSString*)eventTag limittedExtraData:(LimitedExtraDataList*)extraDataList andAppEnvironment:(MintAppEnvironment*)anAppEnvironment;
+ (EventDataFixture*) getInstanceForName:(NSString *)name withLogLevel:(MintLogLevel)logLevel andAppEnvironment:(MintAppEnvironment *)anAppEnvironment;
+ (EventDataFixture*) getInstanceForName:(NSString *)name limittedExtraData:(LimitedExtraDataList*)extraDataList withLogLevel:(MintLogLevel)logLevel andAppEnvironment:(MintAppEnvironment *)anAppEnvironment;

@end
