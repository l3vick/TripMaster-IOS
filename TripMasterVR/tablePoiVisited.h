//
//  tablePoiVisited.h
//  TripMasterVR
//
//  Created by Pablo Rojas Cifre on 18/10/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Quickblox/Quickblox.h>

@interface tablePoiVisited: UITableViewCell{
    /*IBOutlet UIImageView *imagen;
    IBOutlet UILabel *etiqueta;*/
    
}
- (void)modificaLabel: (NSString*)label;
-(void)descargaImagen:(int)cid;
@end
