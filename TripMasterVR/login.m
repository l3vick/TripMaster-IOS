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



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // UIImage *imagen1 = [UIImage imageNamed:@"world-monuments-collage-wall-sticker-7135.png"];
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
    [QBRequest logInWithUserLogin:user.text password:passw.text successBlock:^(QBResponse *response, QBUUser *user) {
        /*UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"MapViewController"];
        vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:vc animated:YES completion:NULL];
        NSLog(@"Se ha logueado correctamente");*/
        
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
        UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"MapViewController"];
        
        [[UIApplication sharedApplication].keyWindow setRootViewController:vc];
        
    } errorBlock:^(QBResponse *response) {
        NSLog(@"No se ha podido loguear");
    }];
}
@end