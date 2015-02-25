//
//  CRAssistent.h
//  iCapps
//
//  Created by Pieterjan Vandegaer on 09/02/15.
//
//

#import <Foundation/Foundation.h>

#define ICACrashReporterTransactionId NSString

@protocol ICACrashReporterProvider <NSObject>

- (void)logBreadcrumb:(NSString *)breadcrumb;
- (void)logEvent:(NSString *)eventInfo;
- (void)logExtraData:(NSString *)key value:(NSString *)value;
- (void)logException:(NSException *)exception;


@end



@interface ICACrashReporter : NSObject

+ (void)initAndStartWithInstance:(id<ICACrashReporterProvider>)key;
+ (void)setUserIdentifier:(NSString *)userId;
+ (void)restartSession:(NSString *)key user:(NSString *)userId;
+ (void)logBreadcrumb:(NSString *)message, ...;
+ (void)logEvent:(NSString *)eventInfo;
+ (void)logExtraData:(NSString *)key value:(NSString *)value;
+ (void)logServiceFailure:(NSInteger)statusCode serviceUrl:(NSString *)serviceUrl httpMethod:(NSString *)httpMethod;
+ (void)logServiceFailureWithURLResponse:(NSHTTPURLResponse *)response;
+ (void)logServiceFailureWithURLResponse:(NSHTTPURLResponse *)response httpMethod:(NSString *)httpMethod;
+ (void)logException:(NSException *)exception;
+ (ICACrashReporterTransactionId *)logTransactionStart;
+ (void)logTransactionStop:(ICACrashReporterTransactionId *)transactionId;
+ (void)logTransactionCancel:(ICACrashReporterTransactionId *)transactionId reason:(NSString *)reason;

@end
