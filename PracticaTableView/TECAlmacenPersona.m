//
//  TECAlmacenPersona.m
//  PracticaTableView
//
//  Created by ITESM CCM on 10/11/14.
//  Copyright (c) 2014 ITESM CCM. All rights reserved.
//

#import "TECAlmacenPersona.h"
#import "TECPersona.h"

@interface TECAlmacenPersona()

@property (nonatomic) NSMutableArray *privatePersonas;

@end

@implementation TECAlmacenPersona

-(TECPersona *) creaPersona {
    TECPersona *persona = [TECPersona personaAleatoria];
    [[self privatePersonas] addObject:persona];
    return persona;
}

-(void)eliminaPersona:(TECPersona *)persona
{
    [[self privatePersonas]removeObjectIdenticalTo:persona]; 
}


//Método privado para incializar a la clase.
-(instancetype) initPrivate {
    self = [super init];
    if(self){
        //inicializa el arreglo
        _privatePersonas = [[NSMutableArray alloc] init];
    }
    return self;
}


+(instancetype)almacenCompartido {
    //Variable global que no será destruida una vez que termine //la ejecución el método
    static TECAlmacenPersona *almacenCompartido = nil;
    if (!almacenCompartido) //¿existe la instancia?
    {
        almacenCompartido = [[self alloc] initPrivate];
    }
    return almacenCompartido;
}

-(instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"use almacenCompartido"
                                 userInfo:nil];
    return nil; }

-(NSArray *)todasLasPersonas {
    return [[self privatePersonas] copy];
}



-(void) moverPersonaFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    if(fromIndex == toIndex) {
        return; }
    TECPersona *persona = [[self privatePersonas]objectAtIndex:fromIndex]; [[self privatePersonas]removeObjectAtIndex:fromIndex];
    [[self privatePersonas]insertObject:persona atIndex:toIndex]; }

@end
