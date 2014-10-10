//
//  Menu_Principal_ViewController.m
//  Quantus
//
//  Created by Carlos Uribe on 22/09/13.
//  Copyright (c) 2013 Comunicacion Constructiva. All rights reserved.
//

#import "Menu_Principal_ViewController.h"

@interface Menu_Principal_ViewController ()

@end

@implementation Menu_Principal_ViewController
@synthesize tam_enc = _tam_enc;
@synthesize tam = _tam;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *img = [UIImage imageNamed:@"quantus_background.png"];
    [_fondo setImage:img];
    
    carga = [[Carga_Envio_Datos alloc] init];
    respuestas = [[Recoleccion_Respuestas_ alloc] init];
    util = [[QAFunctions alloc] init];
    _titulo_empresa.text = @"¡Bienvenido!";
    [self creaBotonesEncuesta];
	// Do any additional setup after loading the view.
}

- (void)creaBotonesEncuesta{
    int total = _encuestas.count/2;
    
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 65, self.view.bounds.size.width, self.view.bounds.size.height-65)];
    for (int i=0;i<total;i++){
        NSString *titulo = [_encuestas objectAtIndex:(2*i)+1];
        double width = titulo.length*8;
        double height = 40;
        double y = (i*50)+10;
        double x = (self.view.bounds.size.width/2)-width/2-10;
        NSInteger tag = (NSInteger)[_encuestas objectAtIndex:2*i];
        UIButton *b = [util botonRojoWithTitle:titulo];
        b.frame = CGRectMake(x, y+307, width+20, height);
        [b addTarget:self action:@selector(botonPressed:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
        [b setTag:tag];
        //b.userInteractionEnabled = YES;
        [subView addSubview:b];
        [self.view.window makeKeyAndVisible];
    }
    [self.view addSubview:subView];
}

- (void)botonPressed:(id)sender{
    UIButton *b = (UIButton*)sender;
    NSString *nombre = b.titleLabel.text;
    int i = [_encuestas indexOfObject:nombre];
    NSLog(@"nombre: %@",nombre);
    NSLog(@"i: %d",i);
    NSInteger enc_id = [[_encuestas objectAtIndex:i-1] integerValue];
    NSLog(@"enc_ind: %d",enc_id);
    [self mandaRespuesta:enc_id];
}

- (void) mandaRespuesta:(NSInteger)enc_ind{
    @try {
        NSString *post =[NSString stringWithFormat:@"username=%@&password=%@&enc_indice=%d",_user,_pass,enc_ind];
        NSLog(@"post: %@",post);
        //NSDictionary *jsonData = [util sendPost:post toURL:@"http://198.61.226.74/quantus_site/info_encuesta.php"];
        NSDictionary *jsonData = [util sendPost:post toURL:@"http://198.61.226.74/quantus_site/info_encuesta.php"];
        NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
        NSLog(@"success %d",success);
        if(success == 1){
            NSString *roll = [jsonData objectForKey:@"roll"];
            [carga setRoll:roll];
            NSLog(@"el valor de succes es: %@", [carga getRoll]);
            // [_loginButton setHidden:YES];
            if ([roll isEqualToString:@"Cliente"]){
                //NSInteger usID = [(NSNumber *) [jsonData objectForKey:@"usID"] integerValue];
                //NSLog(@"usID = %d",usID);
                
                NSString *orgName = [jsonData objectForKey:@"nombre_organizacion"];
                [carga setNombre_organizacion:orgName];
                NSLog(@"Nombre de la organización: %@",[carga getNombre_organizacion]);
                
                NSString *estName = [jsonData objectForKey:@"nombre_estudio"];
                [carga setNombre_estudio:estName];
                NSLog(@"Nombre del estudio: %@",[carga getNombre_estudio]);
                
                NSInteger tam_muestra = [[jsonData objectForKey:@"tam_muestra"] integerValue];
                [carga setNumero_de_encuestas:tam_muestra];
                
                NSInteger num_pregs = [[jsonData objectForKey:@"num_pregs"] integerValue];
                [carga setNum_pregs:num_pregs];
                
                NSLog(@"Num. de preguntas: %d",[carga getNum_pregs]);
                [respuestas initRespuesta:num_pregs*8];
                [carga initPreguntas:num_pregs];
                [carga initAbierta:num_pregs];
                [carga initContenido:num_pregs];
                [carga initObligatoria:num_pregs];
                [carga initSalto1:num_pregs];
                [carga initSalto2:num_pregs];
                [carga initTodas_resp:num_pregs];
                [carga initTp_indice:num_pregs];
                [carga initTot_Opcion:num_pregs];
                [carga initIndiceRespuesta:num_pregs];
                [carga initOpcion:num_pregs*10];
                int indice = 0;
                for (int i=1;i<=num_pregs;i++){
                    NSInteger pregunta = [[jsonData objectForKey:[NSString stringWithFormat:@"pregunta%d",i]] integerValue];
                    [carga setPreguntas:pregunta atnIdex:i-1];
                    NSInteger tp_indice = [[jsonData objectForKey:[NSString stringWithFormat:@"tp_indice%d",i]] integerValue];
                    [carga setTp_indice:tp_indice atnIdex:i-1];
                    NSString *cont = [jsonData objectForKey:[NSString stringWithFormat:@"contenido%d",i]];
                    [carga setContenido:cont atnIdex:i-1];
                    NSString *oblig = [jsonData objectForKey:[NSString stringWithFormat:@"obligatoria%d",i]];
                    [carga setObligatoria:oblig atnIdex:i-1];
                    NSString* todas = [jsonData objectForKey:[NSString stringWithFormat:@"todas_resp%d",1]];
                    [carga setTodas_resp:todas atnIdex:i-1];
                    NSString *abierta = [jsonData objectForKey:[NSString stringWithFormat:@"abierta%d",i]];
                    [carga setAbierta:abierta atnIdex:i-1];
                    NSInteger salto1 = [[jsonData objectForKey:[NSString stringWithFormat:@"salto1%d",i]] integerValue];
                    [carga setSalto1:salto1 atnIdex:i-1];
                    NSInteger salto2 = [[jsonData objectForKey:[NSString stringWithFormat:@"salto2%d",i]] integerValue];
                    [carga setSalto2:salto2 atnIdex:i-1];
                    NSInteger totOpc = [[jsonData objectForKey:[NSString stringWithFormat:@"total_opcs%d",i]] integerValue];
                    NSLog(@"*Pregunta: %d",i);
                    NSLog(@"  tp_indice: %d",tp_indice);
                    NSLog(@"  contenido: %@",cont);
                    NSLog(@"  Obligatoria: %@",oblig);
                    NSLog(@"  Todas las Resp. %@",todas);
                    NSLog(@"  abierta: %@",abierta);
                    NSLog(@"  salto1: %d",salto1);
                    NSLog(@"  salto2: %d",salto2);
                    NSLog(@"total Opcs: %d",totOpc);
                    [carga setTot_Opcion:totOpc atnIdex:i-1];
                    if (tp_indice == 7)
                        [carga setTot_Opcion:totOpc*2 atnIdex:i-1];
                    [carga setIndiceRespuesta:indice atnIdex:i-1];
                    for (int j=1;j<=totOpc;j++){
                        NSString *opc = [jsonData objectForKey:[NSString stringWithFormat:@"opcion%d_%d",j,i]];
                        NSLog(@"indice= %d",indice);
                        [carga setOpcion:opc atnIdex:indice];
                        NSLog(@"    opc: %@",[carga getOpcion:indice]);
                        indice++;
                        if (tp_indice == 7){
                            NSString *opc2 = [jsonData objectForKey:[NSString stringWithFormat:@"opuesto%d_%d",j,i]];
                            [carga setOpcion:opc2 atnIdex:indice];
                            indice++;
                        }
                    }
                    
                }
                [self inicio_Encuesta];
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
        [util alertStatus:@"Login Failed!" withMessage:@"Exception Error!"];
    }
    
}

- (void) inicio_Encuesta{
    
    /*Actividad_6_ViewController *dicotomica = [[Actividad_6_ViewController alloc] init];
    Actividad_8_ViewController *opmultiple = [[Actividad_8_ViewController alloc] init];
    Actividad_17_ViewController *ordenamiento = [[Actividad_17_ViewController alloc] init];
    Actividad_16_ViewController *escala = [[Actividad_16_ViewController alloc] init];
    Actividad_18_ViewController *suma = [[Actividad_18_ViewController alloc] init];
    Actividad_20_ViewController *diferencial = [[Actividad_20_ViewController alloc] init];
    Actividad_2_ViewController *abierta = [[Actividad_2_ViewController alloc] init];
    //int temp = 6;
    switch ( [[carga getTp_indice:0] integerValue]) {
            //temp {
        case 1:
            dicotomica.indice_respuesta = 0;
            dicotomica.indice = [[carga getPreguntas:0] integerValue];
            dicotomica.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            [self presentViewController:dicotomica animated:YES completion:nil];
            break;
        case 2:
            opmultiple.indice_respuesta = 0;
            opmultiple.indice = [[carga getPreguntas:0] integerValue];
            opmultiple.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self presentViewController:opmultiple animated:YES completion:nil];
            break;
        case 3:
            opmultiple.indice_respuesta = 0;
            opmultiple.indice = [[carga getPreguntas:0] integerValue];
            opmultiple.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self presentViewController:opmultiple animated:YES completion:nil];
            break;
        case 4:
            ordenamiento.indice_respuesta = 0;
            ordenamiento.indice = [[carga getPreguntas:0] integerValue];
            ordenamiento.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self presentViewController:ordenamiento animated:YES completion:nil];
            break;
        case 5:
            escala.indice_respuesta = 0;
            escala.indice = [[carga getPreguntas:0] integerValue];
            escala.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self presentViewController:escala animated:YES completion:nil];
            break;
        case 6:
            suma.indice_respuesta = 0;
            suma.indice = [[carga getPreguntas:0] integerValue];
            suma.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self presentViewController:suma animated:YES completion:nil];
            break;
        case 7:
            diferencial.indice_respuesta = 0;
            diferencial.indice = [[carga getPreguntas:0] integerValue];
            diferencial.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self presentViewController:diferencial animated:YES completion:nil];
            break;
        case 8:
            abierta.indice_respuesta = 0;
            abierta.indice = [[carga getPreguntas:0] integerValue];
            abierta.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self presentViewController:abierta animated:YES completion:nil];
            break;
        default:
            break;
    }
    NSLog(@"Holo");
    //[self.navigationController pushViewController:dicotomica animated:YES];
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
