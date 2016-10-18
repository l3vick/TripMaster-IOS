//
//  ProfileViewController.m
//  TripMasterVR
//
//  Created by Pablo Rojas Cifre on 6/10/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import "ProfileViewController.h"
#import "tablePoiCreated.h"
#import "tablePoiVisited.h"
#import "AppDelegate.h"



@interface ProfileViewController ()

@end

@implementation ProfileViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    nsObjetosLeidos = nsObjetosLeidos [0];
    nsmdLocationVSQBObj=[NSMutableDictionary new];
    // Do any additional setup after loading the view.
    NSMutableDictionary *getRequest = [NSMutableDictionary dictionary];
    getRequest = [NSMutableDictionary dictionary];
    [QBRequest objectsWithClassName:@"poicreados" extendedRequest:getRequest successBlock:^(QBResponse *response, NSArray *objects, QBResponsePage *page) {
        // response processing
        for(int i =0; i < objects.count ; i++) {
            QBCOCustomObject *objetoEnLaFila=(QBCOCustomObject*) objects[i];// creamos un QBCO de tipo objeto y lo igualamos a objects
            NSString * Nombre=[objetoEnLaFila.fields objectForKey:@"Nombre"];
            double Latitud=[[objetoEnLaFila.fields objectForKey:@"Lat"] doubleValue];
            double Longitud=[[objetoEnLaFila.fields objectForKey:@"Lon"] doubleValue];
            
            //CLLocation *startLocation = [[CLLocation alloc] initWithLatitude:Latitud longitude:Longitud];
            //startLocation.debugDescription=objetoEnLaFila.ID;
            
            
            nsObjetosLeidos= objects;
            [tabla1 reloadData];
        }
        
     
    } errorBlock:^(QBResponse *response) {
        // error handling
        NSLog(@"Response error: %@", [response.error description]);
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        NSInteger num = 0;
    if(tableView == tabla1){
        num = nsObjetosLeidos.count;
            }
    else if(tableView == tabla2){
        num = 0;
    }else if(tableView == tabla3){
        num = 0;
    }
    
    return num;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if(tableView == tabla1){
        
        tablePoiCreated *cell = [tableView dequeueReusableCellWithIdentifier:@"poicreados" forIndexPath:indexPath];
        int indx = (int) indexPath.row;
        QBCOCustomObject *objetoEnLaFila=(QBCOCustomObject*) nsObjetosLeidos[indx];
        
        NSString * Nombre=[objetoEnLaFila.fields objectForKey:@"namepoi"];
        
        int cid=[[objetoEnLaFila.fields objectForKey:@"cid"] intValue];
        [cell descargaImagen:cid];
        NSString *sCelda = Nombre;
        [cell modificaLabel: sCelda];
    } else if(tableView == tabla2){
       /* tablePoiVisited *cell = [tableView dequeueReusableCellWithIdentifier:@"poicreados" forIndexPath:indexPath];
        int indxV = (int) indexPath.row;*/
    }else if(tableView == tabla3){
        
    }

    /*static NSString *CellIdentifier = @"poicreados";
     // Reuse and create cell
     tablePoiCreated *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
     if (cell == nil) {
     cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
     }
     // Update cell data contents
     
     int indx = (int) indexPath.row;
     
     QBCOCustomObject *objetoEnLaFila=(QBCOCustomObject*) nsObjetosLeidos[indx];
     
     NSString * Nombre=[objetoEnLaFila.fields objectForKey:@"namepoi"];
     
     int cid=[[objetoEnLaFila.fields objectForKey:@"cid"] intValue];
     [cell descargaImagen:cid];
     NSString *sCelda = Nombre;
     [cell modificaLabel: sCelda];
     
     */

    
    
    return cell;
    
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
