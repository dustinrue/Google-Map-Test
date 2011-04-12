//
//  CoreLocationManager.m
//  Google Map Test
//
//  Created by Dustin Rue on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CoreLocationManager.h"


@implementation CoreLocationController

@synthesize locMgr;
@synthesize delegate;


- (id) init {
    self = [super init];
    
    if (self != nil) {
        self.locMgr = [[[CLLocationManager alloc] init] autorelease];
        self.locMgr.delegate = self;
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"in locationManager");
    if([self.delegate conformsToProtocol:@protocol(CoreLocationControllerDelegate)]) {  // Check if the class assigning itself as the delegate conforms to our protocol.  If not, the message will go nowhere.  Not good.
        NSLog(@"it's working");
        @try {
		[self.delegate locationUpdate:newLocation.coordinate.latitude andLongitude:newLocation.coordinate.longitude];
        }
        @catch (NSException * e) {
            NSLog(@"Exception %@",e);
        }
	}
}



@end