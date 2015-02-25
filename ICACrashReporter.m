//
//  CRAssistent.m
//  iCapps
//
//  Created by Pieterjan Vandegaer on 09/02/15.
//
//

#import "ICACrashReporter.h"
//#import <SplunkMint-iOS/SplunkMint-iOS.h>

@implementation ICACrashReporter

static id<ICACrashReporterProvider> _instance = nil;

+ (void)initAndStartWithInstance:(id<ICACrashReporterProvider>)instance {
    //[[Mint sharedInstance] initAndStartSession:key];
    _instance = instance;
    
    [ICACrashReporter logExtraData:@"BundleId" value:[[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleIdentifierKey]];
    [ICACrashReporter logExtraData:@"BuildVersion" value:[[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey]];
}

+ (void)setUserIdentifier:(NSString *)userId {
    [_instance setUserIdentifier:userId];
}

+ (void)logBreadcrumb:(NSString *)message, ... {
    va_list args;
    va_start(args, message);
    NSString *content = [[NSString alloc] initWithFormat:message arguments:args];
    va_end(args);
    
    [_instance logBreadcrumb:content];
}

+ (void)logEvent:(NSString *)eventInfo {
    [_instance logEvent:eventInfo];
}

+ (void)logExtraData:(NSString *)key value:(NSString *)value {
    if (key && value) {
        [_instance logExtraData:key value:value];
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
    [_instance logException:exception];
}

+ (ICACrashReporterTransactionId *)logTransactionStart {
    ICACrashReporterTransactionId *UUID = [[NSUUID UUID] UUIDString];
    //[[Mint sharedInstance] transactionStart:UUID andResultBlock:nil];
    return UUID;
}

+ (void)logTransactionStop:(ICACrashReporterTransactionId *)transactionId {
    //[[Mint sharedInstance] transactionStop:transactionId andResultBlock:nil];
}

+ (void)logTransactionCancel:(ICACrashReporterTransactionId *)transactionId reason:(NSString *)reason {
    //[[Mint sharedInstance] transactionCancel:transactionId reason:reason andResultBlock:nil];
}

@end
