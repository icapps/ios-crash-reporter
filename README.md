# ICACrashReporter

This is the iCapps Crash Reporter tool that can be integrated through a gem.

## Setup

Add the following code to your `Podfile` in order to include the Splunk + Google Analytics integrations:

```
source 'https://github.com/CocoaPods/Specs.git'
source 'https://bitbucket.org/icapps/podspecs'

pod 'ICACrashReporter', '~> 1.2'
```

Run `pod install` in order to install the pod.

If you don't want to use Splunk or Google Analytics (but only the logging module), than you can integrate it seperatly from the `Podfile`. Only add the Core pod like this:

```
pod 'ICACrashReporter/Core', '~> 1.2'
```

If you only want to use Splunk and no Google Analytics or vice versa, than this is the way to do this:

```
pod 'ICACrashReporter/Splunk',          '~> 1.2'
pod 'ICACrashReporter/GoogleAnalytics', '~> 1.2'
```

## Usage

Include the correct header file depending on the pod (Core, Splunk or Google Analytics) you installed.

#### Objective-C

``` objc
#import <ICACrashReporter/Core.h>
#import <ICACrashReporter/Splunk.h>
#import <ICACrashReporter/GoogleAnalytics.h>
```

#### Swift

``` swift
import ICACrashReporter
```

## Bitcode

When you want to use Splunk crash reporting you should **disable** bitcode in your project, because otherwise the symbolication will not work. More info on this in the [Splunk docs](http://docs.splunk.com/Documentation/MintIOSSDK/latest/DevGuide/Requirementsandinstallation).

_The Splunk MINT SDK for iOS now supports bitcode. However, if you also enable bitcode in your app, crash reports in MINT will not be symbolicated because when bitcode is enabled, Apple recompiles the app. The resulting binary uses a different UUID, so a corresponding dSYM bundle cannot be downloaded._

## Documentation

### Session handling

Only log the crashes to your Xcode console.

#### Objective-C

``` objc
#import <ICACrashReporter/Core.h>

[ICACrashReporter initAndStartWithInstance:[ICAConsoleCrashReporter new]];
```

#### Swift

``` swift
import ICACrashReporter

ICACrashReporter.initAndStartWithInstance(ICAConsoleCrashReporteri())
```

Only log the crashes to Splunk.

#### Objective-C

``` objc
#import <ICACrashReporter/Splunk.h>

[ICACrashReporter initAndStartWithInstance:[[ICASplunkCrashReporter alloc] initWithKey:@"YOUR SPLUNK KEY"]];
```

#### Swift

``` swift
import ICACrashReporter

ICACrashReporter.initAndStartWithInstance(ICASplunkCrashReporter(key: "YOUR SPLUNK KEY"))
```

Only log to Google Analytics.

#### Objective-C

``` objc
#import <ICACrashReporter/GoogleAnalytics.h>

[ICACrashReporter initAndStartWithInstance:[[ICAGoogleAnalyticsCrashReporter alloc] initWithKey:@"YOUR ANALYTICS KEY"]];
```

#### Swift

``` swift
import ICACrashReporter

ICACrashReporter.initAndStartWithInstance(ICAGoogleAnalyticsCrashReporter(key: "YOUR ANALYTICS KEY"))
```

You can also combine multiple log mechanisms.

#### Objective-C

``` objc
#import <ICACrashReporter/Splunk.h>
#import <ICACrashReporter/GoogleAnalytics.h>

ICAMultiCrashReporter *reporter = [[ICAMultiCrashReporter alloc] initWithReporters:@[
  [[ICASplunkCrashReporter alloc] initWithKey:@"YOUR SPLUNK KEY"],
  [ICAConsoleCrashReporter new],
  [[ICAGoogleAnalyticsCrashReporter alloc] initWithKey:@"YOUR ANALYTICS KEY"]
]];
[ICACrashReporter initAndStartWithInstance:reporter];
```

#### Swift

``` swift
import ICACrashReporter

let reporter = ICAMultiCrashReporter(reporters: [
  ICASplunkCrashReporter(key: "YOUR SPLUNK KEY"),
  ICAConsoleCrashReporter(),
  ICAGoogleAnalyticsCrashReporter(key: "YOUR ANALYTICS KEY")
])
ICACrashReporter.initAndStartWithInstance(reporter)
```

### User logging

Set the user identifier.

#### Objective-C

``` objc
[ICACrashReporter setUserIdentifier:@"THE USER ID"];
```

#### Swift

``` swift
ICACrashReporter.setUserIdentifier("THE USER ID")
```

### Breadcrumb logging

Log a breadcrumb.

#### Objective-C

``` objc
[ICACrashReporter logBreadcrumb:[NSString stringWithFormat:@"THE CRUMB %@", someScreen]];
```

#### Swift

``` swift
ICACrashReporter.logBreadcrumb("THE CRUMB \(someScreen)")
```

### Service logging

Enable logging when a service call fails.

#### Objective-C

``` objc
[ICACrashReporter logServiceFailureWithURLResponse:response httpMethod:@"GET"];
```

#### Swift

``` swift
ICACrashReporter.logServiceFailureWithURLResponse(response, httpMethod: "GET")
```

_Pass an NSHTTPURLResponse as the first parameter._

Here is what you get when a call to an url doesn't exists:

```
GET: 404: http://some.url
```

### Event logging

Enable event logging.

#### Objective-C

``` objc
[ICACrashReporter logEvent:@"YOUR EVENT"];
```

#### Swift

``` swift
ICACrashReporter.logEvent("YOUR EVENT")
```

### Exception logging

Log handled exceptions that you throw.

#### Objective-C

``` objc
[ICACrashReporter logException:exception];
```

#### Swift

``` swift
ICACrashReporter.logException(exception)
```

_Pass an NSException as the parameter._

### Additional logging

Log some aditional information.

#### Objective-C

``` objc
[ICACrashReporter logExtraData:@"A KEY" value:@"SOME VALUE"];
```

#### Swift

``` swift
ICACrashReporter.logExtraData("A KEY", value: "SOME VALUE")
```

### Transactions

Transaction handling.

#### Objective-C

``` objc
ICACrashReporterTransactionController *controller = [ICACrashReporter transactionController];
[controller startTransaction];
[controller stopTransaction];
[controller cancelTransaction];
```

#### Swift

``` swift
let controller = ICACrashReporter.transactionController()
controller.startTransaction()
controller.stopTransaction()
controller.cancelTransaction()
```
