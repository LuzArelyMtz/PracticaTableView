//
//  TECAnimalesTableTableViewController.m
//  PracticaTableView
//
//  Created by Francisco Javier Vazquez Gomez on 17/08/14.
//  Copyright (c) 2014 Tec Santafe. All rights reserved.
//

#import "TECAnimalesTableTableViewController.h"

@interface TECAnimalesTableTableViewController ()
{
    NSDictionary *animales;
    NSArray *animalesSeccionTitulo; 
}
@end

@implementation TECAnimalesTableTableViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
    //Se inicializa el diccionario y el arreglo con las llaves (alfabeto)
    animales = @{@"A" : @[@"Araña",@"Avestruz"],
                 @"B" : @[@"Ballena",@"Buho"],
                 @"C" : @[@"Caballito de Mar",@"Cabalo", @"Canguro", @"Calamar", @"Caracol"],
                 @"D" : @[@"Delfin"],
                 @"E" : @[@"Elefante",@"Escorpion"],
                 @"F" : @[@"Flamenco",@"Foca"],
                 @"G" : @[@"Gato",@"Gorila", @"Guepardo"],
                 @"H" : @[@"Hipopotamo"],
                 @"J" : @[@"Jirafa"],
                 @"K" : @[@"Koala"],
                 @"L" : @[@"Lagarto",@"Lemur", @"Leon", @"Leopardo", @"Lobo"]};
    
    animalesSeccionTitulo = [[animales allKeys]sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [animalesSeccionTitulo objectAtIndex:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [animalesSeccionTitulo count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *seccionTitulo = [animalesSeccionTitulo objectAtIndex:section];
    NSArray *seccionAnimales = [animales objectForKey:seccionTitulo];
    return [seccionAnimales count];
    }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSString *seccionTitulo = [animalesSeccionTitulo objectAtIndex:indexPath.section];
    NSArray *seccionAnimales = [animales objectForKey:seccionTitulo];
    NSString *animal = [seccionAnimales objectAtIndex:indexPath.row];
    cell.textLabel.text = animal;
    
    return cell;
}

//Se agrega el alfabeto
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return animalesSeccionTitulo;
}
@end
