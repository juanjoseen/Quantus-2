//
//  Menu_Principal_ViewController.h
//  Quantus
//
//  Created by Carlos Uribe on 22/09/13.
//  Copyright (c) 2013 Comunicacion Constructiva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Carga_Envio_Datos.h"
#import "Actividad_6_ViewController.h"//Dicotomica
#import "Actividad_8_ViewController.h"//OpcionMultiple
#import "Actividad_17_ViewController.h"//Ordenamiento
#import "Actividad_16_ViewController.h"//Escala
#import "Actividad_18_ViewController.h"//SumaConstante
#import "Actividad_20_ViewController.h"//DiferencialSemantico
#import "Actividad_2_ViewController.h"//Abierta
//#import "DicotomicaViewController.h"

#import "QAFunctions.h"
#import "ViewController.h"
#import "Recoleccion_Respuestas_.h"

@interface Menu_Principal_ViewController : UIViewController{
    // Carga_Envio_Datos *datos;
    Carga_Envio_Datos *carga;
    QAFunctions *util;
    Recoleccion_Respuestas_ *respuestas;
}
@property (weak, nonatomic) IBOutlet UIImageView *fondo;
@property (weak, nonatomic) IBOutlet UILabel *titulo_empresa;
@property (weak, nonatomic) IBOutlet UIButton *titulo_encuesta;
@property (weak, nonatomic) IBOutlet UILabel *label_tamuestra;
@property int tam_enc;
@property (nonatomic, retain) NSMutableArray *encuestas;
@property (nonatomic, retain) NSString *user;
@property (nonatomic, retain) NSString *pass;
@property bool tam;

@end
