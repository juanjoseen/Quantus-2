//
//  Datos_usuario.m
//  Quantus
//
//  Created by Carlos Uribe on 09/05/13.
//  Copyright (c) 2013 Quantus. All rights reserved.
//

#import "Datos_usuario.h"

static const NSString *user;
static const NSString *pass;

@implementation Datos_usuario
- (id) init{
    if (self = [super init]){
    }
    return self;
}

- (NSString *) getUser{
    return [user lowercaseString];
}

- (void) setUser:(NSString *)valor{
    user = valor;
    //[numero_de_encuestas initWithUnsignedInt:valor];
}

- (NSString *) getPass{
    return [pass lowercaseString];
}

- (void) setPass:(NSString *)valor{
    pass = valor;
}

@end
