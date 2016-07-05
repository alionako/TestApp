//
//  ScheduleViewController.h
//  schedule
//
//  Created by Aliona on 30/06/16.
//  Copyright © 2016 ptenster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataPickerDelegate.h"
@class DescriptionViewController;

@interface ScheduleViewController : UIViewController<DataPickerDelegate>


@property (weak, nonatomic) IBOutlet UIDatePicker *DatePicker;
@property (weak, nonatomic) IBOutlet UILabel *DateLabel;
@property (weak, nonatomic) IBOutlet UIView *DatePickerContainer;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *toLabel;

- (IBAction)DateSelectionButton:(UIButton *)sender;
- (IBAction)DateConfirmationButton:(UIButton *)sender;

@end

