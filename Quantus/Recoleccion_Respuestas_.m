//
//  Recoleccion_Respuestas_.m
//  Quantus
//
//  Created by Carlos Uribe on 08/05/13.
//  Copyright (c) 2013 Quantus. All rights reserved.
//

#import "Recoleccion_Respuestas_.h"
static const NSMutableArray *indice_respuesta;

@implementation Recoleccion_Respuestas_

- (id) init{
    if (self = [super init]){
    }
    return self;
}

- (NSNumber *) getRespuesta:(NSInteger) valor{
    return [indice_respuesta objectAtIndex:valor];
}
- (void) setRespuesta:(NSInteger) valor atnIdex:(NSInteger) valor2{
    NSNumber *v = [[NSNumber alloc] initWithInt:valor];
    [indice_respuesta setObject:v atIndexedSubscript:valor2];//valor = inicio de respuestas de la pregunta, valor2 = numero de pregunta
}
- (void) initRespuesta:(NSInteger) valor{
    indice_respuesta = [[NSMutableArray alloc] initWithCapacity:valor];
}

@end
