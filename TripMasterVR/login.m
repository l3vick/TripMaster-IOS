//
//  login.m
//  TripMasterVR
//
//  Created by Pablo Rojas Cifre on 29/9/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import "login.h"
#import "AppDelegate.h"

@interface login ()

@end

@implementation login



-(AppDelegate *)getAppDelegate{
    return (AppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // UIImage *imagen1 = [UIImage imageNamed:@"world-monuments-collage-wall-sticker-7135.png"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)accionLogin:(id)sender{
   
    [QBRequest logInWithUserLogin:user.text password:passw.text successBlock:[self successBlock] errorBlock:[self errorBlock]];
    
}
