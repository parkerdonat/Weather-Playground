//
//  WPWeather.h
//  Weather Playground
//
//  Created by Parker Donat on 5/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPWeather : NSObject

@property (strong, nonatomic) NSString *locationName;
@property (strong, nonatomic) NSString *weatherMain;
@property (strong, nonatomic) NSString *weatherDescription;
@property (strong, nonatomic) NSString *weatherIcon;
@property (assign, nonatomic) NSString *weatherTemp;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
