//
//  QAFunctions.m
//  Quantus
//
//  Created by Carlos Uribe on 12/03/13.
//  Copyright (c) 2013 Quantus. All rights reserved.
//

#import "QAFunctions.h"

@implementation QAFunctions

- (id) init{
    if (self = [super init]){
        internalError = nil;
    }
    return self;
}

- (NSDictionary *)sendPost:(NSString *)post toURL:(NSString *)URL{
    NSURL *url=[NSURL URLWithString:URL];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *response = nil;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if ([response statusCode] >=200 && [response statusCode] <300){
        NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
        SBJsonParser *jsonParser = [SBJsonParser new];
        NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
        return jsonData;
    } else{
        if (error){
            NSLog(@"Error: %@",error);
            internalError = error;
        }
    }
    return nil;
}

- (NSError *)getError{
    return internalError;
}

- (void)alertStatus:(NSString*)title withMessage:(NSString*)msg{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

- (UIButton *)botonRojoWithTitle:(NSString*)title{
    UIButton *b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIImage *botonRojo = [UIImage imageNamed:@"boton_principal_off.png"];
    [b setBackgroundImage:botonRojo forState:UIControlStateNormal];
    [b setShowsTouchWhenHighlighted:YES];
    [b setImage:[UIImage imageNamed:@"boton_principal_on.png"] forState:UIControlStateSelected];
    [b setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [b setTitle:title forState:(UIControlState)UIControlStateNormal];
    b.userInteractionEnabled = YES;
    return b;
}

@end
