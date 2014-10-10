//
//  ViewController.m
//  Quantus
//
//  Created by Carlos Uribe on 22/09/13.
//  Copyright (c) 2013 Comunicacion Constructiva. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    util = [[QAFunctions alloc] init];
    //carga = [[Carga_Envio_Datos alloc] init];
    usuario = [[Datos_usuario alloc] init];
    isUp = NO;
    animacion = [[QAAnimations alloc] init];
    //UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundClick:)];
    //tapGestureRecognizer.delegate = self;
    _imageLogo.alpha = 0.0;
    //[_imageLogo addGestureRecognizer:tapGestureRecognizer];
    _imageSlogan.alpha = 0.0;
    //[_imageSlogan addGestureRecognizer:tapGestureRecognizer];
    _comienzo.alpha = 0.0;
    //[_backGround addGestureRecognizer:tapGestureRecognizer];
    _userLabel.alpha = 0.0;
    _userText.alpha = 0.0;
   
    
    _passLabel.alpha = 0.0;
    _passText.alpha = 0.0;
 
    
    _loginButton.alpha = 0.0;
    _passText.returnKeyType = UIReturnKeyDone;
    [animacion aparece:_imageLogo];
    [animacion aparece:_imageSlogan withDealy:1.0];
    [animacion aparece:_comienzo withDealy:1.0];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showLogin:(id)sender {
    [animacion desaparece:_comienzo];
    [animacion aparece:_userText];
    [animacion aparece:_userLabel];
    [animacion aparece:_passLabel];
    [animacion aparece:_passText];
    [animacion aparece:_loginButton];
}
- (IBAction)login:(id)sender {
    [self logeo];
}

- (IBAction)userBegin:(id)sender {
    [self sube];
}

- (IBAction)passBegin:(id)sender {
    [self sube];
}

- (IBAction)nextPassword:(id)sender {
    [_userText resignFirstResponder];
    [_passText becomeFirstResponder];
}

- (IBAction)endPassword:(id)sender {
    [_passText resignFirstResponder];
    [self baja];
    [self logeo];
}

-(void) sube{
    if (!isUp ){
        [UIView animateWithDuration:0.2
                         animations:^{
                             self.view.center = CGPointMake(self.view.center.x - 95, self.view.center.y);
                         }];
        isUp = YES;
    }
}

-(void) baja{
    if (isUp){
        [UIView animateWithDuration:0.2
                         animations:^{
                             self.view.center = CGPointMake(self.view.center.x + 95, self.view.center.y);
                         }];
        isUp = NO;
    }
    
}

-(void) logeo{
    @try {
        if ([_userText.text isEqualToString:@""] || [_passText.text isEqualToString:@""]){
            [util alertStatus:@"Login Failed" withMessage:@"User Or Login Needed"];
        } else {
            NSString *post =[NSString stringWithFormat:@"username=%@&password=%@",[_userText text],[_passText text]];
            NSDictionary *jsonData = [util sendPost:post toURL:@"http://198.61.226.74/quantus_site/info_encuesta.php"];
            // NSDictionary *jsonData = [util sendPost:post toURL:@"http://198.61.226.74/quantus_site/info_encuesta.php"];
            NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
            NSLog(@"success %d",success);
            if(success == 1){
                NSString *roll = [jsonData objectForKey:@"roll"];
                if ([roll isEqualToString:@"Cliente"]){
                    [usuario setUser:_userText.text];
                    [usuario setPass:_passText.text];
                    NSInteger total = [[jsonData objectForKey:@"total_encuestas"] integerValue];
                    encuestas = [[NSMutableArray alloc] initWithCapacity:total*2];
                    for (int i=1;i<=total;i++){
                        NSInteger enc_id = [[jsonData objectForKey:[NSString stringWithFormat:@"encuesta%d",i]] integerValue];
                        //NSLog(@"enc_id: %d",enc_id);
                        [encuestas addObject:[[NSNumber alloc] initWithInt:enc_id]];
                        //  NSLog(@"numero encuesta: %d", [encuestas objectAtIndex:[i-1]);
                        NSString *nombre = [jsonData objectForKey:[NSString stringWithFormat:@"nombre%d",i]];
                        [encuestas addObject:nombre];
                        //                               NSLog(@"nombre encuesta: %@", [encuestas objectAtIndex:i-1]);
                    }
                    [self performSegueWithIdentifier:@"BeginSegue" sender:self];
                   /*
                    Menu_Principal_ViewController *inicio = [[Menu_Principal_ViewController alloc] init];
                    inicio.encuestas = encuestas;
                    inicio.user = _userText.text;
                    inicio.pass = _passText.text;
                    inicio.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
                    [self presentViewController:inicio animated:YES completion:nil];
                    //*/
                }
                else
                    [util alertStatus:@"Login Failed!" withMessage:@"No es un usuario valido"];
            } else {
                NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                [util alertStatus:@"Login Failed!" withMessage:error_msg];
                
            }
        }
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
        [util alertStatus:@"Login Failed!" withMessage:@"Login Failed!"];
    }
    
    
    //menu.datos = carga;
    //[self.navigationController pushViewController:menu animated:YES];
    
    
}
//*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"BeginSegue"]){
        Menu_Principal_ViewController *inicio = (Menu_Principal_ViewController*)segue.destinationViewController;
        inicio.encuestas = encuestas;
        inicio.user = _userText.text;
        inicio.pass = _passText.text;
    }
}
//*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
