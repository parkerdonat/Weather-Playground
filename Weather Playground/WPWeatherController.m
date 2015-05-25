//
//  WPWeatherController.m
//  Weather Playground
//
//  Created by Parker Donat on 5/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "WPWeatherController.h"
#import "WPNetworkController.h"

@implementation WPWeatherController

+ (WPWeatherController *)sharedInstance
{
    static WPWeatherController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WPWeatherController alloc] init];
    });
    
    return sharedInstance;
    
}

- (void)getWeatherWithName:(NSString *)name completion:(void (^)(WPWeather *weather))completion
{
    NSString *path = [NSString stringWithFormat:@"weather?q=%@", name];
    [[WPNetworkController api] GET:path parameters:nil success:
     ^(NSURLSessionDataTask *task, id responseObject)
     {
         NSLog(@"getWeatherWithName: %@", responseObject);
         NSDictionary *responseCountry = responseObject;
         WPWeather *weatherObject = [[WPWeather alloc] initWithDictionary:responseCountry];
         completion(weatherObject);
     }
                         failure:
     ^(NSURLSessionDataTask *task, NSError *error)
     {
         NSLog(@"I'm an Error");
         NSLog(@"ERROR: %@", error);
         completion(nil);
     }
     ];
}

@end
