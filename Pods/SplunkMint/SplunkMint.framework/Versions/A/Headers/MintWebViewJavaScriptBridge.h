//
//  MintWebViewJavaScriptBridge.h
//  Splunk-iOS
//
//  Created by Dharmalingam Madheswaran on 1/13/15.
//  Copyright (c) 2015 SLK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RequestWorkerFacadeDelegate.h"
#import <WebKit/WebKit.h>

@interface MintWebViewJavaScriptBridge : NSObject

@property (nonatomic, strong) id<RequestWorkerFacadeDelegate> workerDelegate;

+(instancetype)sharedInstance;
- (void)loadMintJavaScriptFileToUIWebView:(UIWebView*)webView;
- (void)loadMintJavaScriptFileToWKWebView:(WKWebView *)webView;
- (BOOL) processURL:(NSString *) url;
- (void) processScriptMessage:(WKScriptMessage *)message;
- (void)callFunction:(NSString*)functionName withArgs:(id)data;
@end
