//
//  login.m
//  TripMasterVR
//
//  Created by Pablo Rojas Cifre on 29/9/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import "login.h"
#import "AppDelegate.h"
#import "QBAdmin.h"

@interface login ()

@end

@implementation login



- (void)viewDidLoad {
    [super viewDidLoad];
    [self getAppDelegate].qbAdmin.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
    // UIImage *imagen1 = [UIImage imageNamed:@"world-monuments-collage-wall-sticker-7135.png"];
    NSNotificationCenter *notcen = [NSNotificationCenter defaultCenter];
    
    [notcen addObserver:self
               selector:@selector(receiveTestNotification:)
                   name:@"TestNotification"
                 object:nil];
    
    [notcen addObserver:self
               selector:@selector(receiveTestNotification:)
                   name:@"MiNotificacion"
                 object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(AppDelegate *)getAppDelegate{
    return (AppDelegate *) [[UIApplication sharedApplication] delegate];
}

-(IBAction)accionLogin:(id)sender{
    [cargando startAnimating];
    [[self getAppDelegate].qbAdmin login:user.text password:passw.text];
    
}
- (void) receiveTestNotification:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"TestNotification"])
        NSLog (@"EJECUTO TestNotification ViewController");
    if ([[notification name] isEqualToString:@"MiNotificacion"])
        NSLog (@"EJECUTO MiNotificacion");
}


-(void)loginSuccess:(BOOL)blsuccess{
    if(blsuccess){
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
        UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"MapViewController"];
        
        [[UIApplication sharedApplication].keyWindow setRootViewController:vc];
        
    }
    else{
        
    }
}

@end
