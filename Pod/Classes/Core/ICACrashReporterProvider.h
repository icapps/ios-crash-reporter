//
//  ICACrashReporterProvider.h
//  iCapps
//
//  Created by Jelle Vandebeeck on 04/12/15.
//
//

@protocol ICACrashReporterProvider <NSObject>

- (void)logBreadcrumb:(NSString *)breadcrumb;
- (void)logEvent:(NSString *)event;
- (void)logKey:(NSString *)key value:(NSString *)value;
- (void)logException:(NSException *)exception;
- (void)setUserIdentifier:(NSString *)userIdentifier;
- (void)startTransaction:(NSString *)transactionID;
- (void)stopTransaction:(NSString *)transactionID;
- (void)cancelTransaction:(NSString *)transactionID;

@end