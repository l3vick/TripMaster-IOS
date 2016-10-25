//
//  MapViewController.h
//  TripMasterVR
//
//  Created by Marcos Stival Tomé on 4/10/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SWRevealViewController.h"
#import "ILGeoNamesLookup.h"
#import <MobileCoreServices/MobileCoreServices.h>

static NSString *kGeoNamesAccountName = @"rozularen";

@interface MapViewController : UIViewController<ILGeoNamesLookupDelegate, CLLocationManagerDelegate, MKMapViewDelegate>{
    
    
    IBOutlet MKMapView *mapView;
    CLLocationManager *locationManager;
    CLLocation *currentLocation;

}
@property (nonatomic, retain) ILGeoNamesLookup *geocoder;
@property  (nonatomic, strong) IBOutlet UIBarButtonItem *sidebarButton;
@end
