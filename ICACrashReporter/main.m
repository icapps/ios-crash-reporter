//
//  main.m
//  ICACrashReporter
//
//  Created by Pieterjan Vandegaer on 23/02/15.
//  Copyright (c) 2015 iCapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICACrashReporter.h"

int main(int argc, char * argv[]) {
    [ICACrashReporter logBreadcrumb:@"test %@ %f %@", @"x", 23.3, @"TEST"];
    
}