//
//  Station.m
//  schedule
//
//  Created by Aliona on 02/07/16.
//  Copyright © 2016 ptenster. All rights reserved.
//

#import "Station.h"

@implementation Station

-(Station*)initWithDictionary:(NSDictionary*)dict
{
    if (self = [super init]) {
        _name = [dict valueForKey:@"stationTitle"];
        _latitude = [[dict valueForKey:@"point"] valueForKey:@"latitude"];
        _longitude = [[dict valueForKey:@"point"] valueForKey:@"longitude"];
        return self;
    }
    return nil;
}

@end
