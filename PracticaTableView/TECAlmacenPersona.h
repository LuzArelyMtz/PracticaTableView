//
//  TECAlmacenPersona.h
//  PracticaTableView
//
//  Created by ITESM CCM on 10/11/14.
//  Copyright (c) 2014 ITESM CCM. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TECPersona;
@interface TECAlmacenPersona : NSObject

+(instancetype)almacenCompartido;

//Método que va a permitir almacenar una persona aleatoria
-(TECPersona *) creaPersona;

@property (nonatomic, readonly) NSArray *todasLasPersonas;


-(void)eliminaPersona:(TECPersona *)persona;

-(void) moverPersonaFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
