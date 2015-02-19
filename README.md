# iCapps Crash Reporter #

This pod integrates with your project to enable crash reporting.

## Installation ##
* Add the iCapps cocoa pods repository: https://bitbucket.org/icapps/podspecs
* Add the pod to your Podfile:
```
pod 'ICACrashReporter'
```
* Run pod install

If not using pods, make sure to integrate the Splunk framework as well:
http://docs.splunk.com/Documentation/MintSDKs/latest/SplunkMINTSDKs/AddSplunkMINTtoyourprojectforiOS

## Usage ##

Include the header file

```
#import <ICACrashReporter.h>
```

### Functions: ###

**Start a new session:**
```
[ICACrashReporter initAndStartSession:@"KEY"];
```

**Set the user identifier:**
```
[ICACrashReporter setUserIdentifier:@"USERID"];
```

**Restarting the session and setting the user identifier:**
```
[ICACrashReporter restartSession:@"KEY" user:@"USERID"];
```

**Breadcrumb logging:**
```
[ICACrashReporter logBreadcrumb:@"User entered view"];
```

**Service failure logging:**
```
[ICACrashReporter logServiceFailureWithURLResponse:response httpMethod:@"GET"];
```
Directly pass an NSHTTPURLResponse object. This will log an event in the following format:
<HTTPMETHOD>: <ERRORCODE>: <SERVICEURL> 
(for example: GET: 404: http://test.com/function)

**Log handled exception:**
```
[ICACrashReporter logException:exception];
```
Takes an NSException object as argument

**Logging additional information:**
```
[ICACrashReporter logExtraData:@"KEY" value:@"VALUE"];
```