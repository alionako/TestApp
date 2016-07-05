//
//  Stations.h
//  schedule
//
//  Created by Aliona on 02/07/16.
//  Copyright © 2016 ptenster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeoInformation : NSObject

@property (strong, nonatomic) NSArray *from;
@property (strong, nonatomic) NSArray *to;

-(void)loadData;

@end
