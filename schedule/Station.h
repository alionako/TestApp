//
//  Station.h
//  schedule
//
//  Created by Aliona on 02/07/16.
//  Copyright © 2016 ptenster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Station : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *direction;
@property (strong, nonatomic) NSNumber *latitude;
@property (strong, nonatomic) NSNumber *longitude;


-(Station*)initWithDictionary:(NSDictionary*)dict;

@end
