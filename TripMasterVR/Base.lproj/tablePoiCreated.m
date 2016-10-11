//
//  tablePoiCreated.m
//  TripMasterVR
//
//  Created by Pablo Rojas Cifre on 11/10/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import "tablePoiCreated.h"

@implementation tablePoiCreated

- (void)awakeFromNib {
        // Initialization code
    }
    
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
        [super setSelected:selected animated:animated];
        
        // Configure the view for the selected state
        
}
    
- (void)modificaLabel: (NSString*)label {
        etiqueta.text =label;
}

@end
