//
//  City.h
//  schedule
//
//  Created by Aliona on 02/07/16.
//  Copyright © 2016 ptenster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSString *region;
@property (strong, nonatomic) NSString *district;
@property (strong, nonatomic) NSNumber *latitude;
@property (strong, nonatomic) NSNumber *longitude;
@property (strong, nonatomic) NSArray *stations;

-(City*)initWithDictionary:(NSDictionary*)dict forCountry:(NSString*)country;

@end
