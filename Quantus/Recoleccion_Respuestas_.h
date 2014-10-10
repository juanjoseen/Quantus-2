//
//  Recoleccion_Respuestas_.h
//  Quantus
//
//  Created by Carlos Uribe on 08/05/13.
//  Copyright (c) 2013 Quantus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recoleccion_Respuestas_ : NSObject
- (id) init;
- (NSNumber *) getRespuesta:(NSInteger) valor;
- (void) setRespuesta:(NSInteger) valor atnIdex:(NSInteger) valor2;
- (void) initRespuesta:(NSInteger) valor;
@end
