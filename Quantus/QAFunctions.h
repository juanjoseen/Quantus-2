//
//  QAFunctions.h
//  Quantus
//
//  Created by Carlos Uribe on 12/03/13.
//  Copyright (c) 2013 Quantus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"

@interface QAFunctions : NSObject{
    NSError *internalError;
}

- (id)init;
- (void)alertStatus:(NSString*)title withMessage:(NSString*)msg;
- (NSDictionary*)sendPost:(NSString*)post toURL:(NSString*)URL;
- (NSError *)getError;
- (UIButton *)botonRojoWithTitle:(NSString*)title;

@end
