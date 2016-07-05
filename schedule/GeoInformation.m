
//
//  Stations.m
//  schedule
//
//  Created by Aliona on 02/07/16.
//  Copyright © 2016 ptenster. All rights reserved.
//

#import "GeoInformation.h"
#import "City.h"

@implementation GeoInformation {
    NSDictionary *parsedResponseData;
}

-(GeoInformation*)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)loadData {
    NSError *jsonReadingEror = nil;
    NSString *requestUrl = @"https://raw.githubusercontent.com/tutu-ru/hire_ios-test/master/allStations.json";
    NSData *response = [NSData dataWithContentsOfURL:[NSURL URLWithString:requestUrl]];
    id responseData = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:&jsonReadingEror];
   
    // if we fail to process the data
    if (jsonReadingEror != nil || ![responseData isKindOfClass:[NSDictionary class]]) {
        _from = nil;
        _to = nil;
        return;
    }
    
    parsedResponseData = (NSDictionary *)responseData;
    _from = [self citiesForKey:@"citiesFrom"];
    _to = [self citiesForKey:@"citiesTo"];
}



- (NSArray*)citiesForKey:(NSString*)key {
    
    NSMutableArray *result = [NSMutableArray new];
    NSArray *citiesArray = [parsedResponseData valueForKey:key];
    
    for (NSDictionary *city in citiesArray) {
        NSString *country = [city valueForKey:@"countryTitle"];
        City *c = [[City alloc] initWithDictionary:city forCountry:country];
        [result addObject:c];
    }
    return (NSArray*)result;
}

@end
