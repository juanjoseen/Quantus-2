//
//  QAAnimations.h
//  Quantus
//
//  Created by Carlos Uribe on 12/03/13.
//  Copyright (c) 2013 Quantus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QAAnimations : NSObject

- (id) init;
- (void)aparece:(UIView*) img;
- (void)aparece:(UIView *)img withDealy:(double)delay;
- (void)apareceDer:(UIView*) img;
- (void)apareceIzq:(UIView*) img;
- (void)desaparece:(UIView*) img;
- (void)desapareceSINO:(UIView*) img;
- (void) showButton:(UIButton*)boton;

@end
