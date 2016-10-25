//
//  MapViewController.m
//  TripMasterVR
//
//  Created by Marcos Stival Tomé on 4/10/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "ILGeoNamesLookup.h"
#import "JSONKit.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize geocoder;

-(id)init{
    self = [super init];
    if(self){
        self.geocoder = [[ILGeoNamesLookup alloc] initWithUserID:kGeoNamesAccountName];
        geocoder.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
    
    self.geocoder = [[ILGeoNamesLookup alloc] initWithUserID:kGeoNamesAccountName];
    geocoder.delegate = self;
    
    // Do any additional setup after loading the view.
    SWRevealViewController *revealViewController = self.revealViewController;
    NSLog(@"--------------->>>>>>>>>>> %@ ",revealViewController);
    if ( revealViewController )
    {
    
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma API Request
- (void)getPoiAtLocation: (CLLocationCoordinate2D) coord{
    [geocoder findNearbyPlaceNameForLatitude:coord.latitude longitude:coord.longitude];
}

-(void)geoNamesLookup:(ILGeoNamesLookup *)handler networkIsActive:(BOOL)isActive{
    
}

- (void)geoNamesLookup:(ILGeoNamesLookup *)handler didFindGeoNames:(NSArray *)geoNames totalFound:(NSUInteger)total{
    NSLog(@"--------------->>>>>>>>>>> %@ ",geoNames);
    if([geoNames count]){
        
        for (int i=0; i<[geoNames count]; i++) {
            NSDictionary *temp=geoNames[i];
            [temp objectForKey:kILGeoNamesLatitudeKey] ;
            CLLocationCoordinate2D geos;
            geos.latitude=[[temp objectForKey:kILGeoNamesLatitudeKey] doubleValue];
            geos.longitude=[[temp objectForKey:kILGeoNamesLongitudeKey] doubleValue];
            MKPlacemark* marker = [[MKPlacemark alloc] initWithCoordinate:geos addressDictionary:nil];
            [mapView addAnnotation:marker];
        }
        
        /*CLLocationCoordinate2D geos = CLLocationCoordinate2DMake(geoNames[kILGeoNamesLatitudeKey] , geoNames[kILGeoNamesLongitudeKey]);
        MKPlacemark* marker = [[MKPlacemark alloc] initWithCoordinate:geos addressDictionary:nil];
        [mapView addAnnotation:marker];*/
    }
}

-(void)geoNamesLookup:(ILGeoNamesLookup *)handler didFailWithError:(NSError *)error{
    NSLog(@"--------------->>>>>>>>>>>3333333 %@ ",error);
}
#pragma Map Handler     
/*
- (MKAnnotationView *) mapView: (MKMapView *) mapView viewForAnnotation: (id<MKAnnotation>) annotation {
    MKPinAnnotationView *pin = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier: @"annotation_ID"];
    if (pin == nil) {
        pin = [[MKPinAnnotationView alloc] initWithAnnotation: annotation reuseIdentifier: @"annotation_ID"] ;
    } else {
        pin.annotation = annotation;
    }
    pin.pinColor = MKPinAnnotationColorRed;
    pin.animatesDrop = YES;
    return pin;
    
    
    */
//------------ Current Location Address-----
-(void)CurrentLocationIdentifier
{
    //---- For getting current gps location
    
    //------
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    currentLocation = [locations objectAtIndex:0];
    [self getPoiAtLocation:currentLocation.coordinate];
    /*
    currentLocation = [locations objectAtIndex:0];
    [locationManager stopUpdatingLocation];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (!(error))
         {
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             NSLog(@"\nCurrent Location Detected\n");
             NSLog(@"placemark %@",placemark);
             NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
             NSString *Address = [[NSString alloc]initWithString:locatedAt];
             NSString *Area = [[NSString alloc]initWithString:placemark.locality];
             NSString *Country = [[NSString alloc]initWithString:placemark.country];
             NSString *CountryArea = [NSString stringWithFormat:@"%@, %@", Area,Country];
             NSLog(@"%@",CountryArea);
         }
         else
         {
             NSLog(@"Geocode failed with error %@", error);
             NSLog(@"\nCurrent Location Not Detected\n");
             //return;
         }
         /*---- For more results
          placemark.region);
          placemark.country);
          placemark.locality);
          placemark.name);
          placemark.ocean);
          placemark.postalCode);
          placemark.subLocality);
          placemark.location);
          ------*/
     //}];
}




@end
