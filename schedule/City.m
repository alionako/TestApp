//
//  City.m
//  schedule
//
//  Created by Aliona on 02/07/16.
//  Copyright © 2016 ptenster. All rights reserved.
//

#import "City.h"
#import "Station.h"

@implementation City

-(City*)initWithDictionary:(NSDictionary*)dict forCountry:(NSString*)country
{
    if (self = [super init]) {
        _name = [NSString stringWithFormat:@"%@, %@", country, [dict valueForKey:@"cityTitle"]];
        _city = [dict valueForKey:@"cityTitle"];
        _country = country;
        _region = [dict valueForKey:@"regionTitle"];
        _stations = [self parseStations:[dict valueForKey:@"stations"]];
        return self;
    }
    
    return nil;
}

- (NSArray*)parseStations:(NSDictionary*)stations
{
    NSMutableArray *result = [NSMutableArray new];
    for (NSDictionary *station in stations) {
        Station *s = [[Station alloc] initWithDictionary:station];
        [result addObject:s];
    }
    return (NSArray*)result;
}

@end
