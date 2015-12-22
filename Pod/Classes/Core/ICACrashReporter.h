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
+ (void)initAndStartWithInstance:(id<ICACrashReporterProvider>)instance;
+ (void)setUserIdentifier:(NSString *)userId;
+ (void)logBreadcrumb:(NSString *)message, ...;
+ (void)logEvent:(NSString *)eventInfo;
+ (void)logExtraData:(NSString *)key value:(NSString *)value;
+ (void)logServiceFailure:(NSInteger)statusCode serviceUrl:(NSString *)serviceUrl httpMethod:(NSString *)httpMethod;
+ (void)logServiceFailureWithURLResponse:(NSHTTPURLResponse *)response;
+ (void)logServiceFailureWithURLResponse:(NSHTTPURLResponse *)response httpMethod:(NSString *)httpMethod;
+ (void)logException:(NSException *)exception;
+ (ICACrashReporterTransactionController *)transactionController;

@end