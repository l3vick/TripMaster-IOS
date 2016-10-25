//
//  AppDelegate.m
//  TripMasterVR
//
//  Created by Pablo Rojas Cifre on 27/9/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import "AppDelegate.h"
#import "NotificacionTest.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize qbAdmin;

//@synthesize location;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [QBApplication sharedApplication].applicationId = 47655;
    [QBConnection registerServiceKey:@"cc5RrZfkNTdwrRX"];
    [QBConnection registerServiceSecret:@"W-5TgsSZHeNkkR8"];
    [QBSettings setAccountKey:@"BucwT8dUu7ZxWenVXsXy"];
    qbAdmin = [[QBAdmin alloc] init];
    qbAdmin.delegate = self;
   // [qbAdmin login:@"NOMBRE" password:@"PASSWORD"];
   // NSLog(@"1111111");
    nottest=[[NotificacionTest alloc] init];

   /* [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(targetMethod:)
                                   userInfo:nil
                                    repeats:YES];
*/
 
        return YES;
}

-(void)targetMethod:(NSTimer *)timer {
    NSNotificationCenter *notcen = [NSNotificationCenter defaultCenter];
    [notcen
     postNotificationName:@"TestNotification"
     object:self];
}

-(void)loginSuccess:(BOOL)blsuccess{
    NSLog(@"listener");
}
-(AppDelegate *)getAppDelegate{
    return (AppDelegate *) [[UIApplication sharedApplication] delegate];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    //Se ejectuta cuando la aplicacion entra en segundo plano
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [[NSDate date] dateByAddingTimeInterval:60*60*24];
    notification.alertBody = @"24 hours passed since last visit :(";
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
