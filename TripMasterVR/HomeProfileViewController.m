//
//  HomeProfileViewController.m
//  TripMasterVR
//
//  Created by Marcos Stival Tomé on 25/10/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import "HomeProfileViewController.h"

@interface HomeProfileViewController ()

@end

@implementation HomeProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self presentSecondViewControllerFromViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) presentSecondViewControllerFromViewController:(UIViewController *)sourceController
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    
    [[UIApplication sharedApplication].keyWindow setRootViewController:vc];}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
