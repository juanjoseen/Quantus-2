//
//  QAAnimations.m
//  Quantus
//
//  Created by Carlos Uribe on 12/03/13.
//  Copyright (c) 2013 Quantus. All rights reserved.
//

#import "QAAnimations.h"

@implementation QAAnimations

- (id) init{
    if (self = [super init]){
    }
    return self;
}

- (void) aparece:(UIView *)img withDealy:(double)delay{
    [UIView animateWithDuration:2 delay:delay options:UIViewAnimationOptionAllowUserInteraction animations:^{
        img.alpha = 1.0;
    } completion:nil];
}

- (void) aparece:(UIView *)img{
    [UIView animateWithDuration:1
                     animations:^{
                         img.alpha = 1.0;
                     }];
}

- (void) apareceDer:(UIView *)img{
    [UIView animateWithDuration:1
                     animations:^{
                         img.alpha = 1.0;
                         img.center = CGPointMake(img.center.x+50, img.center.y);
                     }];
}

- (void) apareceIzq:(UIView *)img{
    [UIView animateWithDuration:1
                     animations:^{
                         img.alpha = 1.0;
                         img.center = CGPointMake(img.center.x-50, img.center.y+50);
                     }];
}

- (void) desaparece:(UIView *)img{
    [UIView animateWithDuration:1
                     animations:^{
                         img.alpha = 0.0;
                         img.center = CGPointMake(img.center.x, img.center.y+50);
                     }];
}

- (void) desapareceSINO:(UIView *)img{
    [UIView animateWithDuration:1
                     animations:^{
                         img.alpha = 0.0;
                         img.center = CGPointMake(img.center.x, img.center.y);
                     }];
}

- (void) showButton:(UIButton*)boton{
    [boton setHidden:NO];
    [UIView animateWithDuration: 0.2 // duración en segundos
                          delay: 0.0 // no hay retardo para comenzar
                        options: UIViewAnimationOptionAutoreverse // autoreverse
                     animations:^{
                         // seteo la matriz al 115%
                         boton.transform = CGAffineTransformMakeScale(1.15,1.15);
                     }
                     completion:^(BOOL finished){
                         // vuelvo a la matriz normal
                         boton.transform = CGAffineTransformIdentity;
                     }];
}

@end
