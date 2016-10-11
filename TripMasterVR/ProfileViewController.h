//
//  ProfileViewController.h
//  TripMasterVR
//
//  Created by Pablo Rojas Cifre on 6/10/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    
    IBOutlet UILabel *namelbl;
    IBOutlet UILabel *pointslbl;
    IBOutlet UILabel *poicreatedlbl;
    IBOutlet UILabel *latestvisitedlbl;
    IBOutlet UILabel *ranks;
    
    IBOutlet UITextField *nametxt;
    IBOutlet UITextField *pointstxt;
    
    
    IBOutlet UIButton *changePassword;
    IBOutlet UIButton *userReboot;

    
}

@end
