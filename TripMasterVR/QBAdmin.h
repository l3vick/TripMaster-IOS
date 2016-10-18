//
//  QBAdmin.h
//  TripMasterVR
//
//  Created by Pablo Rojas Cifre on 18/10/16.
//  Copyright © 2016 Pablo Rojas Cifre. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol QBAdminDelegate;
@interface QBAdmin : NSObject{
    
}

@property(nonatomic, weak) id<QBAdminDelegate> delegate;//id es Object en java
-(void)login:(NSString*)user password:(NSString*)pass;
@end

@protocol QBAdminDelegate <NSObject>

@optional//todo lo quen sigue a optional son metodos opcionales
-(void) loginSuccess: (BOOL) blsuccess;

@end
