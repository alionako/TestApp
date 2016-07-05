//
//  DescriptionViewController.m
//  schedule
//
//  Created by Aliona on 04/07/16.
//  Copyright © 2016 ptenster. All rights reserved.
//

#import "DescriptionViewController.h"
#import "City.h"
#import "Station.h"

@interface DescriptionViewController ()

@end

@implementation DescriptionViewController

- (void)city:(City*)c station:(Station*)s {
    _cityInfo = c;
    _stationInfo = s;
    [self configureView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)configureView
{
    if (self.cityInfo && self.stationInfo) {
        _country.text = _cityInfo.country;
        _city.text =_cityInfo.city;
        if(_cityInfo.region)
            _region.text = _cityInfo.region;
        if(_cityInfo.district)
            _district.text = _cityInfo.district;
    }
}

#pragma mark Buttons

- (IBAction)closeDescription:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)chooseStation:(UIButton *)sender {
    [self.delegate stationSelected:_stationInfo];
}

@end
