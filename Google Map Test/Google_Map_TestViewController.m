//
//  Google_Map_TestViewController.m
//  Google Map Test
//
//  Created by Dustin Rue on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Google_Map_TestViewController.h"
#import <MapKit/MapKit.h>

@implementation Google_Map_TestViewController

- (void)dealloc
{
    [_mapView release];

    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    CLController = [[CoreLocationController alloc] init];
	CLController.delegate = self;
    NSLog(@"starting to update location");
	[CLController.locMgr startUpdatingLocation];
}

- (void)locationUpdate:(double)incomingLatitude andLongitude:(double)incomingLongitude {
	//latitude = [location coordinate.latitude];
    //longitude = [location coordinate.longitude];
    NSLog(@"location was updated");
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = incomingLatitude;
    zoomLocation.longitude = incomingLongitude;
    NSLog(@"current location is %f, %f",incomingLatitude,incomingLongitude);
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    // 3
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];                
    // 4
    NSLog(@"asking mapView to redraw");
    [_mapView setRegion:adjustedRegion animated:YES];
}


- (void)viewDidAppear:(BOOL)animated {
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 36.8772222;
    zoomLocation.longitude = -96.7894444;
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);

    // 3
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];                
    // 4
    [_mapView setRegion:adjustedRegion animated:YES]; 
}

- (void)viewDidUnload
{
    [_mapView release];
    _mapView = nil;
    

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
