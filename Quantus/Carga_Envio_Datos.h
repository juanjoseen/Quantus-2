//
//  Carga_Envio_Datos.h
//  Quantus
//
//  Created by Carlos Uribe on 02/04/13.
//  Copyright (c) 2013 Quantus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Carga_Envio_Datos : NSObject

- (id) init;

- (NSInteger) getSucces;
- (void) setSucces:(NSInteger) valor;
- (NSString *) getRoll;
- (void) setRoll:(NSString *) valor;
- (NSInteger) getNumero_de_encuestas;
- (void) setNumero_de_encuestas:(NSInteger) valor;
- (NSString *) getNombre_organizacion;
- (void) setNombre_organizacion:(NSString *) valor;
- (NSString *) getNombre_estudio;
- (void) setNombre_estudio:(NSString *) valor;
- (NSInteger) getNum_pregs;
- (void) setNum_pregs:(NSInteger) valor;
//Indice de Preguntas
- (NSNumber *) getPreguntas:(NSInteger) valor;
- (void) setPreguntas:(NSInteger) valor atnIdex:(NSInteger) valor2;
- (void) initPreguntas:(NSInteger) valor;
//COntenido de las Preguntas
- (NSString *) getContenido:(NSInteger) valor;
- (void) setContenido:(NSString *) valor atnIdex:(NSInteger) valor2;
- (void) initContenido:(NSInteger) valor;
//Son Obligatorias
- (NSMutableArray *) getObligatoria:(NSInteger) valor;
- (void) setObligatoria:(NSString *) valor atnIdex:(NSInteger) valor2;
- (void) initObligatoria:(NSInteger) valor;
//Se tiene que marcar todas las respuestas para poder avanzar
- (NSMutableArray *) getTodas_resp:(NSInteger) valor;
- (void) setTodas_resp:(NSString *) valor atnIdex:(NSInteger) valor2;
- (void) initTodas_resp:(NSInteger) valor;
//Son preguntas abiertas
- (NSString *) getAbierta:(NSInteger) valor;
- (void) setAbierta:(NSString *) valor atnIdex:(NSInteger) valor2;
- (void) initAbierta:(NSInteger) valor;
//Saltan a otra pregunta
- (NSNumber *) getSalto1:(NSInteger) valor;
- (void) setSalto1:(NSInteger) valor atnIdex:(NSInteger) valor2;
- (void) initSalto1:(NSInteger) valor;
//Salto
- (NSNumber *) getSalto2:(NSInteger) valor;
- (void) setSalto2:(NSInteger) valor atnIdex:(NSInteger) valor2;
- (void) initSalto2:(NSInteger) valor;
//Indice de Actividad que esta asociado a la pregunta
- (NSNumber *) getTp_indice:(NSInteger) valor;
- (void) setTp_indice:(NSInteger) valor atnIdex:(NSInteger) valor2;
- (void) initTp_indice:(NSInteger) valor;
//Numero de opciones que contiene cada respuesta
- (NSNumber *) getTot_Opcion:(NSInteger) valor;
- (void) setTot_Opcion:(NSInteger) valor atnIdex:(NSInteger) valor2;
- (void) initTot_Opcion:(NSInteger) valor;
//Respuestas
- (NSString *) getOpcion:(NSInteger) valor;
- (void) setOpcion:(NSString *) valor atnIdex:(NSInteger) valor2;
- (void) initOpcion:(NSInteger) valor;
//Indice de inicio de respuestas en el NSMutableArray dependiendo de la pregunta
- (NSNumber *) getIndiceRespuesta:(NSInteger) valor;
- (void) setIndiceRespuesta:(NSInteger) valor atnIdex:(NSInteger) valor2;
- (void) initIndiceRespuesta:(NSInteger) valor;


@end
