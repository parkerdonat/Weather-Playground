//
//  WPNetworkController.h
//  Weather Playground
//
//  Created by Parker Donat on 5/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface WPNetworkController : NSObject

+ (AFHTTPSessionManager *)api;

@end
