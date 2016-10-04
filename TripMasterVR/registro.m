//
//  register.m
//  TripMasterVR
//
//  Created by Pablo Rojas Cifre on 29/9/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import "registro.h"
#import "AppDelegate.h"

@implementation registro

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(AppDelegate *)getAppDelegate{
    return (AppDelegate *) [[UIApplication sharedApplication] delegate];
}

-(IBAction)accionRegistro:(id)sender{

    QBUUser *qbuser = [QBUUser user];
    
    qbuser.password = passw.text;
    qbuser.login = user.text;
    qbuser.email = email.text;
    
 
    [QBRequest signUp:qbuser successBlock:^(QBResponse *response, QBUUser *user) {
        [self performSegueWithIdentifier:@"registro" sender:self];
        NSLog(@"Se ha registrado correctamente");
    } errorBlock:^(QBResponse *response) {
        NSLog(@"No se ha registrado");// Handle error here
    }];
} 
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
