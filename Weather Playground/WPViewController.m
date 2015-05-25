//
//  WPViewController.m
//  Weather Playground
//
//  Created by Parker Donat on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//
#import "WPViewController.h"
#import "WPWeatherController.h"
#import "WPWeather.h"
#import "UIImageView+AFNetworking.h"

@interface WPViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

- (IBAction)searchButtonPressed:(id)sender;

@end

@implementation WPViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (double)celsiusFromKelvinString:(NSString *)kelvin
{
    double kelvinDouble = [kelvin doubleValue];
    return kelvinDouble - 273.15;
}

- (IBAction)searchButtonPressed:(UIButton *)sender
{
    [[WPWeatherController sharedInstance] getWeatherWithName:[self.searchField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] completion:
     ^(WPWeather *weather)
     {
         self.cityName.text = weather.locationName;
         self.temperatureLabel.text = [NSString stringWithFormat:@"%.1fº C", [self celsiusFromKelvinString:weather.weatherTemp]];
         self.mainLabel.text = weather.weatherMain;
         self.descriptionLabel.text = weather.weatherDescription;
         
         NSString *iconString = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", weather.weatherIcon];
         NSURL *iconURL = [NSURL URLWithString:iconString];
         [self.iconImageView setImageWithURL:iconURL];
     }];
}

@end
