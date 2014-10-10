//
//  Carga_Envio_Datos.m
//  Quantus
//
//  Created by Carlos Uribe on 02/04/13.
//  Copyright (c) 2013 Quantus. All rights reserved.
//

#import "Carga_Envio_Datos.h"

static const NSString *succes;
static const NSMutableArray *tp_indice;
static const NSString *roll;
static const NSString *numero_de_encuestas;
static const NSString *nombre_organizacion;
static const NSString *nombre_estudio;
static const NSString *num_pregs;
static const NSMutableArray *preguntas;
static const NSMutableArray *contenido;
static const NSMutableArray *obligatoria;
static const NSMutableArray *todas_resp;
static const NSMutableArray *abierta;
static const NSMutableArray *salto1;
static const NSMutableArray *salto2;
static const NSMutableArray *tot_opcion;
static const NSMutableArray *opcion;
static const NSMutableArray *indice_respuesta;

@implementation Carga_Envio_Datos/*{
    NSInteger succes;
    NSString *roll;
    NSInteger numero_de_encuestas;
    NSString *nombre_organizacion;
    NSString *nombre_estudio;
    NSInteger num_pregs;
    NSMutableArray *preguntas;
    NSMutableArray *contenido;
    NSMutableArray *obligatoria;
    NSMutableArray *todas_resp;
    NSMutableArray *abierta;
    NSMutableArray *salto1;
    NSMutableArray *salto2;
}*/
- (id) init{
    if (self = [super init]){
    }
    return self;
}

- (void) setSucces:(int) valor{
    succes = [NSString stringWithFormat:@"%d",valor];
    //[succes initWithFormat:@"%d",valor];
}

- (NSInteger) getSucces{
    return [succes integerValue];
    //return [succes integerValue];
}

- (NSString *) getRoll{
    return [roll capitalizedString];
}

- (void) setRoll:(NSString *) valor{
    roll = valor;
}

- (NSInteger) getNumero_de_encuestas{
    return [numero_de_encuestas integerValue];
}

- (void) setNumero_de_encuestas:(NSInteger) valor{
    numero_de_encuestas = [NSString stringWithFormat:@"%d", valor];
    //[numero_de_encuestas initWithUnsignedInt:valor];
}

- (NSString *) getNombre_organizacion{
    return [nombre_organizacion capitalizedString];
}

- (void) setNombre_organizacion:(NSString *) valor{
    nombre_organizacion = valor;
}

- (NSString *) getNombre_estudio{
    return [nombre_estudio capitalizedString];
}

- (void) setNombre_estudio:(NSString *) valor{
    nombre_estudio = valor;
}

- (NSInteger) getNum_pregs{
    return [num_pregs integerValue];
}

- (void) setNum_pregs:(NSInteger) valor{
    num_pregs = [NSString stringWithFormat:@"%d", valor];
    //[num_pregs initWithUnsignedInt:valor];
}

- (NSNumber *) getPreguntas:(NSInteger) valor{
    return [preguntas objectAtIndex:valor];
}

- (void) setPreguntas:(NSInteger) valor atnIdex:(NSInteger) valor2{
    NSNumber *v = [[NSNumber alloc] initWithInt:valor];
    [preguntas setObject:v atIndexedSubscript:valor2];
    
}

- (void) initPreguntas:(NSInteger) valor{
    preguntas = [[NSMutableArray alloc] initWithCapacity:valor];
}

- (NSString *) getContenido:(NSInteger) valor{
    return [contenido  objectAtIndex:valor];
}

- (void) setContenido:(NSString *) valor atnIdex:(NSInteger) valor2{
    [contenido setObject:valor atIndexedSubscript:valor2];
}

- (void) initContenido:(NSInteger) valor{
    contenido = [[NSMutableArray alloc] initWithCapacity:valor];
}

- (NSMutableArray *) getObligatoria:(NSInteger) valor{
    return [obligatoria objectAtIndex:valor];
}

- (void) setObligatoria:(NSString *) valor atnIdex:(NSInteger) valor2{
    [obligatoria setObject:valor atIndexedSubscript:valor2];
}

- (void) initObligatoria:(NSInteger)valor{
    obligatoria = [[NSMutableArray alloc] initWithCapacity:valor];
}

- (NSString *) getTodas_resp:(NSInteger) valor{
    return [todas_resp objectAtIndex:valor];
}

- (void) setTodas_resp:(NSString *) valor atnIdex:(NSInteger) valor2{
    [todas_resp setObject:valor atIndexedSubscript:valor2];
}

- (void) initTodas_resp:(NSInteger)valor{
    todas_resp = [[NSMutableArray alloc] initWithCapacity:valor];
}

- (NSMutableArray *) getAbierta:(NSInteger) valor{
    return [abierta objectAtIndex:valor];
}

- (void) setAbierta:(NSString *) valor atnIdex:(NSInteger) valor2{
    [abierta setObject:valor atIndexedSubscript:valor2];
}

- (void) initAbierta:(NSInteger)valor{
    abierta = [[NSMutableArray alloc] initWithCapacity:valor];
}

- (NSNumber *) getSalto1:(NSInteger) valor{
    return [salto1 objectAtIndex:valor];
}

- (void) setSalto1:(NSInteger) valor atnIdex:(NSInteger) valor2{
    NSNumber *v = [[NSNumber alloc] initWithInt:valor];
    [salto1 setObject:v atIndexedSubscript:valor2];
}

- (void) initSalto1:(NSInteger)valor{
    salto1 = [[NSMutableArray alloc] initWithCapacity:valor];
}

- (NSNumber *) getSalto2:(NSInteger) valor{
    return [salto2 objectAtIndex:valor];
}

- (void) setSalto2:(NSInteger) valor atnIdex:(NSInteger) valor2{
    NSNumber *v = [[NSNumber alloc] initWithInt:valor];
    [salto2 setObject:v atIndexedSubscript:valor2];
}

- (void) initSalto2:(NSInteger)valor{
    salto2 = [[NSMutableArray alloc] initWithCapacity:valor];
}

- (NSNumber *) getTp_indice:(NSInteger) valor{
    return [tp_indice objectAtIndex:valor];
}

- (void) setTp_indice:(NSInteger) valor atnIdex:(NSInteger)valor2{
    NSNumber *v = [[NSNumber alloc] initWithInt:valor];
    [tp_indice setObject:v atIndexedSubscript:valor2];
}

- (void) initTp_indice:(NSInteger)valor{
    tp_indice = [[NSMutableArray alloc] initWithCapacity:valor];
}
- (NSNumber *) getTot_Opcion:(NSInteger) valor{
    return [tot_opcion objectAtIndex:valor];
}

- (void) setTot_Opcion:(NSInteger) valor atnIdex:(NSInteger) valor2{
    NSNumber *v = [[NSNumber alloc] initWithInt:valor];
    [tot_opcion setObject:v atIndexedSubscript:valor2];
}

- (void) initTot_Opcion:(NSInteger) valor{
    tot_opcion = [[NSMutableArray alloc] initWithCapacity:valor];
}

- (NSString *) getOpcion:(NSInteger) valor{
    return [opcion objectAtIndex:valor];
}

- (void) setOpcion:(NSString *) valor atnIdex:(NSInteger) valor2{
    [opcion setObject:valor atIndexedSubscript:valor2];
}

- (void) initOpcion:(NSInteger) valor{
    opcion = [[NSMutableArray alloc] initWithCapacity:valor];
}

- (NSNumber *) getIndiceRespuesta:(NSInteger) valor{
    return [indice_respuesta objectAtIndex:valor];
}
- (void) setIndiceRespuesta:(NSInteger) valor atnIdex:(NSInteger) valor2{
     NSNumber *v = [[NSNumber alloc] initWithInt:valor];
    [indice_respuesta setObject:v atIndexedSubscript:valor2];//valor = inicio de respuestas de la pregunta, valor2 = numero de pregunta
}
- (void) initIndiceRespuesta:(NSInteger) valor{
    indice_respuesta = [[NSMutableArray alloc] initWithCapacity:valor];
}
@end
