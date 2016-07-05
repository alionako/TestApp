//
//  DataPickerDelegate.h
//  schedule
//
//  Created by Aliona on 05/07/16.
//  Copyright © 2016 ptenster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Station.h"

@protocol DataPickerDelegate <NSObject>

- (void)stationSelected:(Station *)station;

@end
