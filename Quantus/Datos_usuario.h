//
//  Datos_usuario.h
//  Quantus
//
//  Created by Carlos Uribe on 09/05/13.
//  Copyright (c) 2013 Quantus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Datos_usuario : NSObject
- (id) init;
- (NSString *) getUser;
- (void) setUser:(NSString *) valor;
- (NSString *) getPass;
- (void) setPass:(NSString *) valor;
@end
