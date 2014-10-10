//
//  ViewController.h
//  Quantus
//
//  Created by Carlos Uribe on 22/09/13.
//  Copyright (c) 2013 Comunicacion Constructiva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QAFunctions.h"
#import "QAAnimations.h"
#import "Carga_Envio_Datos.h"
#import "Menu_Principal_ViewController.h"
#import "Datos_usuario.h"

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>{
    QAFunctions *util;
    QAAnimations *animacion;
    BOOL isUp;
    Carga_Envio_Datos *carga;
    NSMutableArray *encuestas;
    Datos_usuario *usuario;
}

@property (weak, nonatomic) IBOutlet UIButton *comienzo;
@property (weak, nonatomic) IBOutlet UIImageView *imageLogo;
@property (weak, nonatomic) IBOutlet UIImageView *imageSlogan;
@property (weak, nonatomic) IBOutlet UIImageView *backGround;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *passLabel;
@property (weak, nonatomic) IBOutlet UITextField *userText;
@property (weak, nonatomic) IBOutlet UITextField *passText;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;







@end
