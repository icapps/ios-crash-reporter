//
//  CRAssistent.m
//  iCapps
//
//  Created by Pieterjan Vandegaer on 09/02/15.
//
//

#import "ICACrashReporter.h"
#import <SplunkMint-iOS/SplunkMint-iOS.h>

@implementation ICACrashReporter

+ (void)initAndStartSession:(NSString *)key {
    [[Mint sharedInstance] initAndStartSession:key];
    [ICACrashReporter logExtraData:@"BundleId" value:[[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleIdentifierKey]];
    [ICACrashReporter logExtraData:@"BuildVersion" value:[[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey]];
}

+ (void)setUserIdentifier:(NSString *)userId {
    [[Mint sharedInstance] setUserIdentifier:userId];
}

+ (void)restartSession:(NSString *)key user:(NSString *)userId {
    [ICACrashReporter setUserIdentifier:userId];
    [ICACrashReporter initAndStartSession:key];
}

+ (void)logBreadcrumb:(NSString *)message, ... {
    va_list args;
    va_start(args, message);
    NSString *content = [[NSString alloc] initWithFormat:message arguments:args];
    va_end(args);
    
    NSLog(content);
    //[[Mint sharedInstance] leaveBreadcrumb:content];
}

+ (void)logEvent:(NSString *)eventInfo {
    [[Mint sharedInstance] logEventAsyncWithTag:eventInfo completionBlock:nil];
}

+ (void)logExtraData:(NSString *)key value:(NSString *)value {
    if (key && value) {
        [[Mint sharedInstance] addExtraData:[[ExtraData alloc] initWithKey:key andValue:value]];
    }
}

+ (void)logServiceFailure:(NSInteger)statusCode serviceUrl:(NSString *)serviceUrl httpMethod:(NSString *)httpMethod {
    if ([serviceUrl length] > 50) {
        serviceUrl = [serviceUrl substringFromIndex:serviceUrl.length - 50];
    }
    NSString *eventInfo = [NSString stringWithFormat:@"%li: %@", (long)statusCode, serviceUrl];
    if (httpMethod && httpMethod.length > 0) {
        eventInfo = [NSString stringWithFormat:@"%@: %@", httpMethod, eventInfo];
    }
    [ICACrashReporter logEvent:eventInfo];
}

+ (void)logServiceFailureWithURLResponse:(NSHTTPURLResponse *)response {
    [ICACrashReporter logServiceFailureWithURLResponse:response httpMethod:nil];
}

+ (void)logServiceFailureWithURLResponse:(NSHTTPURLResponse *)response httpMethod:(NSString *)httpMethod {
    [ICACrashReporter logServiceFailure:response.statusCode serviceUrl:response.URL.absoluteString httpMethod:httpMethod];
}

+ (void)logException:(NSException *)exception {
    MintLogException(exception, nil);
}

+ (ICACrashReporterTransactionId *)logTransactionStart {
    ICACrashReporterTransactionId *UUID = [[NSUUID UUID] UUIDString];
    [[Mint sharedInstance] transactionStart:UUID andResultBlock:nil];
    return UUID;
}

+ (void)logTransactionStop:(ICACrashReporterTransactionId *)transactionId {
    [[Mint sharedInstance] transactionStop:transactionId andResultBlock:nil];
}

+ (void)logTransactionCancel:(ICACrashReporterTransactionId *)transactionId reason:(NSString *)reason {
    [[Mint sharedInstance] transactionCancel:transactionId reason:reason andResultBlock:nil];
}

@end
