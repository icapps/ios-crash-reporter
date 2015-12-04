//
//  ICACrashReporter.m
//  iCapps
//
//  Created by Pieterjan Vandegaer on 09/02/15.
//
//

#import "ICACrashReporter.h"
#import "ICACrashReporterTransactionController.h"

@implementation ICACrashReporter

#pragma mark - Singleton

+ (ICACrashReporter *)sharedInstance {
    static dispatch_once_t onceToken;
    static ICACrashReporter *reporterInstance;
    dispatch_once(&onceToken, ^{
        reporterInstance = [ICACrashReporter new];
    });
    return reporterInstance;
}

#pragma mark - Provider

- (void)setProvider:(id<ICACrashReporterProvider>)provider {
    _provider = provider;
    
    [self logKey:@"BundleId" value:[[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleIdentifierKey]];
    [self logKey:@"BuildVersion" value:[[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey]];
}

#pragma mark - Identifier

- (void)setUserIdentifier:(NSString *)userIdentifier {
    [self.provider setUserIdentifier:userIdentifier];
}

#pragma mark - Breadcrumb

- (void)logBreadcrumb:(NSString *)breadcrumb {
    NSString *date = [[self dateFormatter] stringFromDate:[NSDate date]];
    [self.provider logBreadcrumb:[NSString stringWithFormat: @"(%@) %@", date, breadcrumb]];
}

#pragma mark - Event

- (void)logEvent:(NSString *)event {
    [self.provider logEvent:event];
}

#pragma mark - Data

- (void)logKey:(NSString *)key value:(NSString *)value {
    if (key && value) [self.provider logKey:key value:value];
}

#pragma mark - Exceptions

- (void)logServiceFailureWithResponse:(NSHTTPURLResponse *)response {
    [self logServiceFailureWithResponse:response HTTPMethod:nil];
}

- (void)logServiceFailureWithResponse:(NSHTTPURLResponse *)response HTTPMethod:(NSString *)HTTPMethod {
    [self logServiceFailureWithStatusCode:response.statusCode serviceURL:response.URL.absoluteString HTTPMethod:HTTPMethod];
}

- (void)logServiceFailureWithStatusCode:(NSInteger)statusCode serviceURL:(NSString *)serviceURL HTTPMethod:(NSString *)HTTPMethod {
    NSMutableArray *components = [@[@(statusCode).stringValue, serviceURL] mutableCopy];
    if (HTTPMethod && [HTTPMethod length] > 0) [components insertObject:HTTPMethod atIndex:0];
    [self logEvent:[components componentsJoinedByString:@" - "]];
}

- (void)logException:(NSException *)exception {
    [self.provider logException:exception];
}

#pragma mark - Transactions

- (ICACrashReporterTransactionController *)instantiateTransactionController {
    return [[ICACrashReporterTransactionController alloc] initWithProvider:self.provider];
}

#pragma mark - Date formatting

- (NSDateFormatter *)dateFormatter {
    static dispatch_once_t onceFormatterToken;
    static NSDateFormatter *dateFormatter = nil;
    dispatch_once(&onceFormatterToken, ^{
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"HH:mm:ss";
    });
    return dateFormatter;
}

@end
