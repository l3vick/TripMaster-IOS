//
//  AppDelegate.h
//  TripMasterVR
//
//  Created by Pablo Rojas Cifre on 27/9/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Quickblox/Quickblox.h>
#import "QBAdmin.h"
#import "NotificacionTest.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, QBAdminDelegate>{
    NotificacionTest *nottest;
}


@property (strong, nonatomic) QBAdmin *qbAdmin;
@property (strong, nonatomic) QBUUser *usuario;
@property (strong, nonatomic) QBCOCustomObject *filaViajeros;
@property (strong, nonatomic) UIWindow *window;
//@property (strong, nonatomic) LocationAdmin *location;


@end

