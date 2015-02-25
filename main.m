//
//  main.m
//  ICACrashReporter
//
//  Created by Pieterjan Vandegaer on 23/02/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICACrashReporter.h"
#import "ICASplunkCrashReporter.h"
#import "ICAConsoleCrashReporter.h"
#import "ICACrashReporterTransactionController.h"

int main(int argc, char * argv[]) {
    //[ICACrashReporter initAndStartWithInstance:[[ICASplunkCrashReporter alloc] initWithKey:@"bc3ef72f"]];
    [ICACrashReporter initAndStartWithInstance:[ICAConsoleCrashReporter new]];
    [ICACrashReporter logBreadcrumb:@"test %@ %f %@", @"x", 23.3, @"TEST"];

    [ICACrashReporter logServiceFailure:404 serviceUrl:@"http://icapps.com" httpMethod:@"GET"];
    [ICACrashReporter setUserIdentifier:@"user A"];
    [ICACrashReporter logEvent:@"new event"];
    [ICACrashReporter logExtraData:@"key" value:@"value"];
    
    [ICACrashReporter logException:[NSException exceptionWithName:@"new exception" reason:@"crashed" userInfo:nil]];
    
    ICACrashReporterTransactionController *controller = [ICACrashReporter transactionController];
    [controller startTransaction];
    [controller stopTransaction];
    [controller cancelTransaction];
}
