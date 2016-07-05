//
//  ScheduleViewController.m
//  schedule
//
//  Created by Aliona on 30/06/16.
//  Copyright © 2016 ptenster. All rights reserved.
//

#import "ScheduleViewController.h"
#import "StationsViewController.h"

@interface ScheduleViewController ()

@end

@implementation ScheduleViewController {
    NSDateFormatter *dateFormatter;
    NSString *direction;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _DatePickerContainer.hidden = YES;
    [self configureDatePicker];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Buttons

- (IBAction)DateSelectionButton:(UIButton *)sender {
    _DatePickerContainer.hidden = NO;
}

- (IBAction)DateConfirmationButton:(UIButton *)sender {
    _DateLabel.text = [self formatDate: _DatePicker.date];
    _DatePickerContainer.hidden = YES;
}


#pragma mark Date magic

// returns a human-readable string from date
-(NSString*)formatDate:(NSDate*)date {
    NSString *formatedDate = nil;
    if (dateFormatter == nil) {
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    }
    formatedDate = [dateFormatter stringFromDate:date];
    return formatedDate;
}

// user doesn't need to select the date that is passed
-(void)configureDatePicker {
    NSDate *today = [NSDate date];
    [_DatePicker setMinimumDate: today];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    direction = [segue identifier];
    StationsViewController *stationsListView = (StationsViewController *)[segue destinationViewController];
    [stationsListView loadStations:direction];
    stationsListView.delegate = self;
}

- (void)stationSelected:(Station *)station {
    
    if ([direction isEqualToString:@"fromStations"])
        _fromLabel.text = station.name;
    
    if ([direction isEqualToString:@"toStations"])
        _toLabel.text = station.name;

}

@end
