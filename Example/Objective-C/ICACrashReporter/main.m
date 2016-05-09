//
//  main.m
//  ICACrashReporter
//
//  Created by Jelle Vandebeeck on 12/03/2015.
//  Copyright (c) 2015 Jelle Vandebeeck. All rights reserved.
//

#import "CoreObject.h"
#import "GoogleAnalyticsObject.h"

int main(int argc, char * argv[])
{
    NSLog(@"🔥 Running the iCapps Crash Reporting Core tool");
    [CoreObject new];
    
    NSLog(@"🔥 Running the iCapps Crash Reporting Google Analytics tool");
    [GoogleAnalyticsObject new];
}
