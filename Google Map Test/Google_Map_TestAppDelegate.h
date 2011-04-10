//
//  Google_Map_TestAppDelegate.h
//  Google Map Test
//
//  Created by Dustin Rue on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Google_Map_TestViewController;

@interface Google_Map_TestAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Google_Map_TestViewController *viewController;

@end
