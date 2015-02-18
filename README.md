# iCapps Crash Reporter #

This pod integrates with your project to enable crash reporting.

## Installation ##
1. Add the iCapps cocoa pods repository: https://bitbucket.org/icapps/podspecs
2. Add the pod to your Podfile:
```
pod 'ICACrashReporter'
```

## Usage ##

Include the header file

```
#import <ICACrashReporter.h>
```

Functions:

Start a new session:
```
[ICACrashReporter initAndStartSession:@"KEY"];
```

Set the user identifier:
```
[ICACrashReporter setUserIdentifier:@"USERID"];
```

Restarting the session and setting the user identifier:
```
[ICACrashReporter restartSession:@"KEY" user:@"USERID"];
```

Breadcrumb logging:
```
[ICACrashReporter logBreadcrumb:@"User entered view"];
```

