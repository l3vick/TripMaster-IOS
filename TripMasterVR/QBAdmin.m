//
//  QBAdmin.m
//  TripMasterVR
//
//  Created by Pablo Rojas Cifre on 18/10/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import "QBAdmin.h"
#import <Quickblox/Quickblox.h>

@implementation QBAdmin

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}



-(void)login:(NSString*)user password:(NSString*)pass{
    
    [QBRequest logInWithUserLogin:user password:pass successBlock:^(QBResponse *response, QBUUser *user) {
        /*UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
         UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"MapViewController"];
         vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
         [self presentViewController:vc animated:YES completion:NULL];
         NSLog(@"Se ha logueado correctamente");*/
        
          [_delegate loginSuccess:true];
        
    } errorBlock:^(QBResponse *response) {
        NSLog(@"No se ha podido loguear");
        [_delegate loginSuccess:false];
        
    }];

    
    
    
}


@end
