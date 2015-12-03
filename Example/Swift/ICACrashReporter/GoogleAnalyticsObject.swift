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
        let multiReporter = ICAMultiCrashReporter(reporters: reporters)
        ICACrashReporter.initAndStartWithInstance(multiReporter)
        
        // Run some reporting tools.
        ICACrashReporter.logServiceFailure(404, serviceUrl: "http://icapps.com", httpMethod: "GET")
        ICACrashReporter.logBreadcrumb("KAWA BUNGA")
        ICACrashReporter.setUserIdentifier("123")
        ICACrashReporter.logEvent("BOOM!")
        ICACrashReporter.logExtraData("a", value: "b")
        ICACrashReporter.logException(NSException(name: "BOOM", reason: "Inconsistent design", userInfo: nil))
        
        // Try the transaction controller.
        let controller = ICACrashReporter.transactionController()
        controller.startTransaction()
        controller.stopTransaction()
        controller.cancelTransaction()
    }
}