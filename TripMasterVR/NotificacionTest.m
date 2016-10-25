//
//  NotificacionTest.m
//  Notifications&Delegates
//
//  Created by Jonathan Bar Magen Numhauser on 25/10/16.
//  Copyright © 2016 Jonathan Bar Magen Numhauser. All rights reserved.
//

#import "NotificacionTest.h"

@implementation NotificacionTest

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter *notcen = [NSNotificationCenter defaultCenter];
        [notcen addObserver:self
                   selector:@selector(receiveTestNotification:)
                       name:@"TestNotification"
                     object:nil];
        
        [notcen removeObserver:self];
    }
    return self;
}

- (void) receiveTestNotification:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"TestNotification"])
        NSLog (@"EJECUTO TestNotification NotificationTest");
    if ([[notification name] isEqualToString:@"MiNotificacion"])
        NSLog (@"EJECUTO MiNotificacion");
}
@end
