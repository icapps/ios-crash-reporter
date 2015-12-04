//
//  GoogleAnalyticsObject.swift
//  ICACrashReporter Example
//
//  Created by Jelle Vandebeeck on 03/12/15.
//  Copyright © 2015 Jelle Vandebeeck. All rights reserved.
//

import Foundation
import ICACrashReporter

class GoogleAnalyticsObject {
    
    // MARK: - Init
    
    init() {
        setupCrashReporter()
    }
    
    // MARK: - Setup
    
    private func setupCrashReporter() {
        // Setup the reporters.
        let reporters = [
            ICAConsoleCrashReporter(),
            ICAGoogleAnalyticsCrashReporter()
        ]
        let provider = ICAMultiCrashReporter(reporters: reporters)
        ICACrashReporter.sharedInstance().provider = provider
        
        // Run some reporting tools.
        ICACrashReporter.sharedInstance().logServiceFailureWithStatusCode(404, serviceURL: "http://icapps.com", HTTPMethod: "GET")
        ICACrashReporter.sharedInstance().logBreadcrumb("KAWA BUNGA")
        ICACrashReporter.sharedInstance().userIdentifier = "123"
        ICACrashReporter.sharedInstance().logEvent("BOOM!")
        ICACrashReporter.sharedInstance().logKey("a", value: "b")
        
        // Log an exception.
        let exception = NSException(name: "BOOM", reason: "Inconsistent design", userInfo: nil)
        ICACrashReporter.sharedInstance().logException(exception)
        
        // Use the transaction controller.
        let controller = ICACrashReporter.sharedInstance().instantiateTransactionController()
        controller.start()
        controller.stop()
        controller.cancel()
    }
}