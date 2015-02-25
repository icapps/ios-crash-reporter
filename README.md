# iCapps Crash Reporter #

This pod integrates with your project to enable crash reporting.

## Installation ##
* Add the iCapps cocoa pods repository: https://bitbucket.org/icapps/podspecs
* Add the pod to your Podfile:
```
pod 'ICACrashReporter'
```
* Run pod install

*If not using pods, make sure to integrate the [Splunk framework](http://docs.splunk.com/Documentation/MintSDKs/latest/SplunkMINTSDKs/AddSplunkMINTtoyourprojectforiOS) as well.*

If you only need console logging you can use the this instead:
```
pod 'ICACrashReporter/Core'
```

## Usage ##

Include the header file

```
#!objc
#import <ICACrashReporter.h>
```

### Functions: ###

ICACrashReporter has to be started with a reporting module. Modules are available for **Console output** and **Splunk**.
There is also the option of combining multiple modules using the ICAMultiCrashReporter class.

**Start a new session:**
```
#!objc
//Console:
#import <ICAConsoleCrashReporter.h>
[ICACrashReporter initAndStartWithInstance:[ICAConsoleCrashReporter new]];

//Splunk:
#import <ICASplunkCrashReporter.h>
[ICACrashReporter initAndStartWithInstance:[[ICASplunkCrashReporter alloc] initWithKey:@"SPLUNKKEY"]];

//Combining multiple modules:
#import <ICAMultiCrashReporter.h>
#import <ICAConsoleCrashReporter.h>
#import <ICASplunkCrashReporter.h>
ICAMultiCrashReporter *multiReporter = [[ICAMultiCrashReporter alloc] initWithReporters:@[
                [[ICASplunkCrashReporter alloc] initWithKey:@"SPLUNKKEY"],
                [ICAConsoleCrashReporter new]
        ]];
[ICACrashReporter initAndStartWithInstance:multiReporter];
```

**Set the user identifier:**
```
#!objc
[ICACrashReporter setUserIdentifier:@"USERID"];
```
**Breadcrumb logging:**
```
#!objc
[ICACrashReporter logBreadcrumb:@"User entered %@", view.name];
```

**Service failure logging:**
```
#!objc
[ICACrashReporter logServiceFailureWithURLResponse:response httpMethod:@"GET"];
```
Directly pass an NSHTTPURLResponse object. This will log an event in the following format:
<HTTPMETHOD>: <ERRORCODE>: <SERVICEURL> 
(for example: GET: 404: http://test.com/function)

**Log event:**
```
#!objc
[ICACrashReporter logEvent:@"Event has happened"];
```

**Log handled exception:**
```
#!objc
[ICACrashReporter logException:exception];
```
Takes an NSException object as argument

**Logging additional information:**
```
#!objc
[ICACrashReporter logExtraData:@"KEY" value:@"VALUE"];
```

**Transactions**
```
#!objc
//Create a new transaction
ICACrashReporterTransactionController *controller = [ICACrashReporter transactionController];
//Starting the transaction
[controller startTransaction];
//Stopping the transaction
[controller stopTransaction];
//Cancelling the transaction
[controller cancelTransaction];
```