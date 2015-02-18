# iCapps Crash Reporter #

This pod integrates with your project to enable crash reporting.

## Installation ##
1. Add the iCapps cocoa pods repository: https://bitbucket.org/icapps/podspecs
2. Add the pod to your Podfile:
```
pod 'ICACrashReporter'
```

## Usage ##

### + (void)initAndStartSession:(NSString *)key; ###
### + (void)setUserIdentifier:(NSString *)userId; ###
### + (void)restartSession:(NSString *)key user:(NSString *)userId; ###
### + (void)logBreadcrumb:(NSString *)breadcrumb; ###
### + (void)logEvent:(NSString *)eventInfo; ###
### + (void)logExtraData:(NSString *)key value:(NSString *)value; ###
### + (void)logServiceFailure:(NSInteger)statusCode serviceUrl:(NSString *)serviceUrl httpMethod:(NSString *)httpMethod; ###
### + (void)logServiceFailureWithURLResponse:(NSHTTPURLResponse *)response; ###
### + (void)logServiceFailureWithURLResponse:(NSHTTPURLResponse *)response httpMethod:(NSString *)httpMethod; ###
### + (void)logException:(NSException *)exception; ###
### + (ICACrashReporterTransactionId *)logTransactionStart; ###
### + (void)logTransactionStop:(ICACrashReporterTransactionId *)transactionId; ###
### + (void)logTransactionCancel:(ICACrashReporterTransactionId *)transactionId reason:(NSString *)reason; ###