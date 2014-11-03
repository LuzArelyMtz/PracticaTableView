//
//  TECPersona.m
//  PracticaPropiedades
//
//  Created by Francisco Javier Vazquez Gomez on 09/07/14.
//  Copyright (c) 2014 tec.santafe. All rights reserved.
//

#import "TECPersona.h"

@implementation TECPersona


//Metodo de clase
+(instancetype) personaAleatoria
{
    NSString *nombre, *apPaterno;
    int edad;
    
    NSArray *randomNombres = @[@"Shakira", @"David"];
   
    NSInteger index = arc4random() % [randomNombres count];
    nombre = randomNombres[index];
   
    
    edad = arc4random() % 80;
    
    int numeroImagen = arc4random() %21;
    
    NSString *nombreImage= [NSString stringWithFormat:@"Foto%d.jpeg", numeroImagen];
    //Crear la foto
    UIImage *imagen= [UIImage imageNamed:nombreImage];
    
    // pasar el parametro foto
    
    TECPersona *newPersona = [[self alloc] initWithNombre:nombre
                                                apPaterno:apPaterno edad:edad
                                                foto:imagen];
    return newPersona;
}

-(void) setPadre:(TECPersona *)papa
{
    _padre = papa;
    [papa setHijo:self];
}


-(instancetype) init
{
    self = [super init];
    if (self) {
        NSDate *hoy = [[NSDate alloc] init];
        _fechaAlta = hoy;
    }
    return self;
}



-(instancetype) initWithNombre:(NSString *)nombre
                          foto:(UIImage *)foto
{
    self = [self init];
    if (self) {
        _nombre = nombre;
        _rutaImagen=foto;
        
    }
    return self;
}

/**
 * Sobrecarga del método description
 */
-(NSString *) description
{
    NSString *desc = [[NSString alloc] initWithFormat:
                      @"Nombre : %@ %@ - Edad: %d -Imagen: %@ -Fecha Alta: %@",
                      [self nombre], 
                      [self rutaImagen],
                      [self fechaAlta]];
    return desc;
}

@end
