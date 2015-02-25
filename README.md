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
#import <ICACrashReporter.h>
```

### Functions: ###

ICACrashReporter has to be started with a reporting module. Modules are available for **Console output** and **Splunk**.
There is also the option of combining multiple modules using the ICAMultiCrashReporter class.

**Start a new session:**
```
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
[ICACrashReporter setUserIdentifier:@"USERID"];
```
**Breadcrumb logging:**
```
[ICACrashReporter logBreadcrumb:@"User entered %@", view.name];
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

**Transactions**
```
//Create a new transaction
ICACrashReporterTransactionController *controller = [ICACrashReporter transactionController];
//Starting the transaction
[controller startTransaction];
//Stopping the transaction
[controller stopTransaction];
//Cancelling the transaction
[controller cancelTransaction];
```