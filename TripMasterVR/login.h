//
//  login.h
//  TripMasterVR
//
//  Created by Pablo Rojas Cifre on 29/9/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QBAdmin.h"

@interface login : UIViewController<QBAdminDelegate>{
    
    IBOutlet UITextField *user;
    IBOutlet UITextField *passw;
    
    IBOutlet UIButton *facebook;
    IBOutlet UIButton *forgot;
    IBOutlet UIButton *signin;
    IBOutlet UIButton *signup;
    
    IBOutlet UIActivityIndicatorView *cargando;
    
}


@end
