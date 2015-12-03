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

``` objc
#import <ICACrashReporter/Core.h>
#import <ICACrashReporter/Splunk.h>
#import <ICACrashReporter/GoogleAnalytics.h>
```

## Documentation

### Session handling

Only log the crashes to your Xcode console.

``` objc
#import <ICACrashReporter/Core.h>

[ICACrashReporter initAndStartWithInstance:[ICAConsoleCrashReporter new]];
```

Only log the crashes to Splunk.

``` objc
#import <ICACrashReporter/Splunk.h>

[ICACrashReporter initAndStartWithInstance:[[ICASplunkCrashReporter alloc] initWithKey:@"SPLUNKKEY"]];
```

Only log to Google Analytics.

``` objc
#import <ICACrashReporter/GoogleAnalytics.h>

[ICACrashReporter initAndStartWithInstance:[[ICAGoogleAnalyticsCrashReporter alloc] initWithKey:@"YOUR ANALYTICS KEY"]];
```

You can also combine multiple log mechanisms.

``` objc
#import <ICACrashReporter/Splunk.h>
#import <ICACrashReporter/GoogleAnalytics.h>

ICAMultiCrashReporter *reporter = [[ICAMultiCrashReporter alloc] initWithReporters:@[
  [[ICASplunkCrashReporter alloc] initWithKey:@"SPLUNKKEY"],
  [ICAConsoleCrashReporter new],
  [[ICAGoogleAnalyticsCrashReporter alloc] initWithKey:@"GAKEY"]
]];
[ICACrashReporter initAndStartWithInstance:reporter];
```

### User logging

Set the user identifier.

``` objc
[ICACrashReporter setUserIdentifier:@"THE USER ID"];
```

### Breadcrumb logging

Log a breadcrumb.

``` objc
[ICACrashReporter logBreadcrumb:@"THE CRUMB %@", someScreen];
```

### Service logging

Enable loggin when a service call fails.

``` objc
[ICACrashReporter logServiceFailureWithURLResponse:response httpMethod:@"GET"];
```

_Pass an NSHTTPURLResponse as the first parameter._

Here is what you get when a call to an url doesn't exists:

```
GET: 404: http://some.url
```

### Event logging

Enable event logging.

``` objc
[ICACrashReporter logEvent:@"YOUR EVENT"];
```

### Exception logging

Log handled exceptions that you throw.

``` objc
[ICACrashReporter logException:exception];
```

_Pass an NSException as the parameter._

### Additional logging

Log some aditional information.

``` objc
[ICACrashReporter logExtraData:@"A KEY" value:@"SOME VALUE"];
```

### Transactions

Transaction handling.

``` objc
ICACrashReporterTransactionController *controller = [ICACrashReporter transactionController];
[controller startTransaction];
[controller stopTransaction];
[controller cancelTransaction];
```
