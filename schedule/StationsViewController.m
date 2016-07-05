//
//  StationsViewController.m
//  schedule
//
//  Created by Aliona on 02/07/16.
//  Copyright © 2016 ptenster. All rights reserved.
//

#import "StationsViewController.h"
#import "DescriptionViewController.h"
#import "GeoInformation.h"
#import "City.h"
#import "Station.h"

@interface StationsViewController ()
@property (nonatomic, strong) UISearchController *searchController;
@end

@implementation StationsViewController {
    NSArray *stations;
    NSArray *allStations;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // configure uisearch
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    [self configureSearchBar];
    
    [self configureNavigationbar];
}



- (void)loadStations:(NSString*)direction
{
    GeoInformation *info = [[GeoInformation alloc] init];
    [info loadData];
    
    if ([direction isEqualToString:@"fromStations"])
        stations = info.from;
    
    if ([direction isEqualToString:@"toStations"])
        stations = info.to;
    
    allStations = stations;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Configure views

- (void) configureNavigationbar
{
    self.navigationItem.title = @"Станции";
    UIBarButtonItem *reloadButton = [UIBarButtonItem new];
    reloadButton.title = @"Обновить";
    reloadButton.target = self;
    reloadButton.action = @selector(reload:);
    self.navigationItem.rightBarButtonItem = reloadButton;
}

-(IBAction)reload:(UIBarButtonItem*)sender
{
    [self showAllStations];
}

-(void)configureSearchBar {
    self.searchController.searchResultsUpdater = self;
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
}

#pragma mark - Filtering

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self showSearchResultsForText:searchController.searchBar.text];
}

-(void)showAllStations {
    stations = allStations;
    [self.tableView reloadData];
}

-(void)showSearchResultsForText:(NSString*)text {
    NSString *trimmedText = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (![trimmedText isEqual: @""] && text.length > 0) {
        [self filterResultsForString:text];
    }
}

-(void)filterResultsForString:(NSString*)searchString{
    NSPredicate *filterParam = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchString];
    NSMutableArray *filteredStations = [NSMutableArray new];
    for (City *c in stations) {
        NSArray *cityStations = c.stations;
        NSArray *filteredCityStations = [cityStations filteredArrayUsingPredicate:filterParam];
        if (filteredCityStations.count > 0) {
            City *copy = c;
            copy.stations = filteredCityStations;
            [filteredStations addObject:copy];
        }
    }
    stations = (NSArray*)filteredStations;
    [self.tableView reloadData];
}

#pragma mark - TableView Data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    City *currentCity = [stations objectAtIndex:section];
    return currentCity.stations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"stationCell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"stationCell"];
    }
    
    City *currentCity = [stations objectAtIndex:indexPath.section];
    Station *currentStation = [currentCity.stations objectAtIndex:indexPath.row];
    cell.textLabel.text = [currentStation name];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return stations.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[stations objectAtIndex:section] name];
}

#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        City *city = stations[indexPath.section];
        Station *station = city.stations[indexPath.row];
        DescriptionViewController *description = (DescriptionViewController *)[[segue destinationViewController] topViewController];
        [description setTitle: station.name];
        [description city:city station:station];
        description.delegate = self;
    }
}

- (void)stationSelected:(Station *)station {
    [self.delegate stationSelected:station];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:NO];
}

@end
