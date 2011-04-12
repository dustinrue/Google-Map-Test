//
//  Google_Map_TestViewController.h
//  Google Map Test
//
//  Created by Dustin Rue on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CoreLocationManager.h"

#define METERS_PER_MILE 309.344

@interface Google_Map_TestViewController : UIViewController<CoreLocationControllerDelegate> {
    
    CoreLocationController *CLController;
    IBOutlet MKMapView *_mapView;
    double latitude;
    double longitude;
}

- (void)locationUpdate:(double)latitude andLongitude:(double)longitude;
@property (nonatomic, retain) CoreLocationController *CLController;

@end
