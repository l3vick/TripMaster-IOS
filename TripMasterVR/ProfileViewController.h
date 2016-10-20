//
//  ProfileViewController.h
//  TripMasterVR
//
//  Created by Pablo Rojas Cifre on 6/10/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import "poiCreados.h"
#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    
    IBOutlet UILabel *namelbl;
    IBOutlet UILabel *pointslbl;
    IBOutlet UILabel *poicreatedlbl;
    IBOutlet UILabel *latestvisitedlbl;
    IBOutlet UILabel *ranks;
    
    IBOutlet UILabel *nametxt;
    IBOutlet UILabel *pointstxt;
    
    
    IBOutlet UIButton *changePassword;
    IBOutlet UIButton *userReboot;
    IBOutlet UITableView *tabla1;
    IBOutlet UITableView *tabla2;
    IBOutlet UITableView *tabla3;
    NSArray *nsObjetosLeidos;
    NSArray *nsObjetosLeidos2;

    NSMutableDictionary *nsmdLocationVSQBObj;

    
}

@end
