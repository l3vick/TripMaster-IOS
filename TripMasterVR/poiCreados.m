//
//  poiCreados.m
//  TripMasterVR
//
//  Created by Pablo Rojas Cifre on 20/10/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import "poiCreados.h"

@implementation poiCreados

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)modificaLabel: (NSString*)label {
    etiqueta.text =label;
}
-(void)descargaImagen:(int)cid{
    [QBRequest downloadFileWithID:cid successBlock:^(QBResponse *response, NSData *fileData) {
        UIImage *imagenDescargada=[UIImage imageWithData:fileData];
        [imagen setImage:imagenDescargada];
        
    } statusBlock:^(QBRequest *request, QBRequestStatus *status) {
        
        NSLog(@"download progress: %f", status.percentOfCompletion);
    } errorBlock:^(QBResponse *response) {
        NSLog(@"error: %@", response.error);
    }];
}

@end
