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
    self.geocoder = [[ILGeoNamesLookup alloc] initWithUserID:kGeoNamesAccountName];
    geocoder.delegate = self;
    
    // Do any additional setup after loading the view.
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    [self getPoiAtLocation];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma API Request
- (void)getPoiAtLocation{
    [geocoder findNearbyPlaceNameForLatitude:40.538996 longitude:-3.896759];
}

-(void)geoNamesLookup:(ILGeoNamesLookup *)handler networkIsActive:(BOOL)isActive{
    
}

- (void)geoNamesLookup:(ILGeoNamesLookup *)handler didFindGeoNames:(NSArray *)geoNames totalFound:(NSUInteger)total{
    NSLog(@"--------------->>>>>>>>>>> %@ ",geoNames);
    if([geoNames count]){
        
        for (int i=0; i<[geoNames count]; i++) {
            NSDictionary *temp=geoNames[i];
            [temp objectForKey:kILGeoNamesLatitudeKey] ;
            CLLocationCoordinate2D geos;// = CLLocationCoordinate2DMake(lat,[temp objectForKey:kILGeoNamesLongitudeKey]);
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
}


@end
