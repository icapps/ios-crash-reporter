//
//  ICACrashReporter.h
//  iCapps
//
//  Created by Pieterjan Vandegaer on 09/02/15.
//
//

#import <Foundation/Foundation.h>

#import "ICACrashReporterProvider.h"

@class ICACrashReporterTransactionController;

@interface ICACrashReporter : NSObject

@property (nonatomic, strong) id<ICACrashReporterProvider> provider;
@property (nonatomic, strong) NSString *userIdentifier;

+ (ICACrashReporter *)sharedInstance;

- (void)logBreadcrumb:(NSString *)breadcrumb;
- (void)logEvent:(NSString *)event;
- (void)logKey:(NSString *)key value:(NSString *)value;
- (void)logServiceFailureWithStatusCode:(NSInteger)statusCode serviceURL:(NSString *)serviceURL HTTPMethod:(NSString *)HTTPMethod;
- (void)logServiceFailureWithResponse:(NSHTTPURLResponse *)response;
- (void)logServiceFailureWithResponse:(NSHTTPURLResponse *)response HTTPMethod:(NSString *)HTTPMethod;
- (void)logException:(NSException *)exception;
- (ICACrashReporterTransactionController *)instantiateTransactionController;

// Deprecated methods.
+ (void)initAndStartWithInstance:(id<ICACrashReporterProvider>)instance DEPRECATED_MSG_ATTRIBUTE("Use the instance methods 'setProviders:' on the sharedInstance instead.");
+ (void)setUserIdentifier:(NSString *)userId DEPRECATED_MSG_ATTRIBUTE("Use the instance methods 'setUserIdentifier:' on the sharedInstance instead.");
+ (void)logBreadcrumb:(NSString *)message, ... DEPRECATED_MSG_ATTRIBUTE("Use the instance methods 'logBreadcrumb:' on the sharedInstance instead.");;
+ (void)logEvent:(NSString *)eventInfo DEPRECATED_MSG_ATTRIBUTE("Use the instance methods 'logEvent:' on the sharedInstance instead.");;
+ (void)logExtraData:(NSString *)key value:(NSString *)value DEPRECATED_MSG_ATTRIBUTE("Use the instance methods 'logKey:value:' on the sharedInstance instead.");;
+ (void)logServiceFailure:(NSInteger)statusCode serviceUrl:(NSString *)serviceUrl httpMethod:(NSString *)httpMethod DEPRECATED_MSG_ATTRIBUTE("Use the instance methods 'logServiceFailureWithStatusCode:serviceURL:HTTPMethod:' on the sharedInstance instead.");;
+ (void)logServiceFailureWithURLResponse:(NSHTTPURLResponse *)response DEPRECATED_MSG_ATTRIBUTE("Use the instance methods 'logServiceFailureWithResponse:' on the sharedInstance instead.");;
+ (void)logServiceFailureWithURLResponse:(NSHTTPURLResponse *)response httpMethod:(NSString *)httpMethod DEPRECATED_MSG_ATTRIBUTE("Use the instance methods 'logServiceFailureWithResponse:HTTPMethod:' on the sharedInstance instead.");;
+ (void)logException:(NSException *)exception DEPRECATED_MSG_ATTRIBUTE("Use the instance methods 'logException:' on the sharedInstance instead.");;
+ (ICACrashReporterTransactionController *)transactionController DEPRECATED_MSG_ATTRIBUTE("Use the instance methods 'instantiateTransactionController' on the sharedInstance instead.");;

@end