//
//  DescriptionViewController.h
//  schedule
//
//  Created by Aliona on 04/07/16.
//  Copyright © 2016 ptenster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataPickerDelegate.h"
@class City, Station;

@interface DescriptionViewController : UIViewController

@property (nonatomic, weak) id<DataPickerDelegate> delegate;

@property (strong, nonatomic) City* cityInfo;
@property (strong, nonatomic) Station* stationInfo;
@property (weak, nonatomic) IBOutlet UILabel *country;
@property (weak, nonatomic) IBOutlet UILabel *region;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *district;

- (IBAction)closeDescription:(UIBarButtonItem *)sender;
- (IBAction)chooseStation:(UIButton *)sender;
- (void)city:(City*)c station:(Station*)s;

@end
