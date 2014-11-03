//
//  TECPersona.h
//  PracticaPropiedades
//
//  Created by Francisco Javier Vazquez Gomez on 09/07/14.
//  Copyright (c) 2014 tec.santafe. All rights reserved.
//

#import <Foundation/Foundation.h>
//UIKit

#import <UIKit/UIKit.h>

@interface TECPersona : NSObject

@property (nonatomic, copy) NSString *nombre;
@property (nonatomic, copy) NSString *apPaterno;
@property (nonatomic) int edad;
@property (nonatomic, readonly, strong)NSDate *fechaAlta;
@property (nonatomic, copy) UIImage *rutaImagen;



@property (nonatomic, strong)TECPersona *padre;
@property (nonatomic, weak)TECPersona *hijo;
//Propiedad de tipo UIImage

+(instancetype) personaAleatoria;

-(instancetype) initWithNombre:(NSString *)nombre
                     apPaterno:(NSString *)ap
                          edad:(int) edad
                          foto:(UIImage *)foto;

//crear un constructor nuevo o utilizar el mismo pero agregandole la foto 

@end



