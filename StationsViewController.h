//
//  StationsViewController.h
//  schedule
//
//  Created by Aliona on 02/07/16.
//  Copyright © 2016 ptenster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataPickerDelegate.h"

@interface StationsViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating, DataPickerDelegate>

@property (nonatomic, weak) id<DataPickerDelegate> delegate;

-(void)loadStations:(NSString*)direction;

@end