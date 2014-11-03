//
//  TECItemsViewController.m
//  PracticaTableView
//
//  Created by ITESM CCM on 10/11/14.
//  Copyright (c) 2014 ITESM CCM. All rights reserved.
//

#import "TECItemsViewController.h"
#import "TECAlmacenPersona.h"
#import "TECPersona.h"
#import "TECDetallePersonaViewController.h"
#import "ReproductorViewController.h"


@interface TECItemsViewController ()

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end


@implementation TECItemsViewController

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData]; }

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    TECDetallePersonaViewController *detallePersonaVC = [[TECDetallePersonaViewController alloc]init];
    
    ReproductorViewController *reproductorVC=[[ReproductorViewController alloc]init];
    
    
    NSArray *personas = [[TECAlmacenPersona almacenCompartido]todasLasPersonas];
    TECPersona *personaSeleccionada = personas[indexPath.row];
    //[detallePersonaVC setPersona:personaSeleccionada];
    [reproductorVC setPersona:personaSeleccionada];
    
    [[self navigationController]pushViewController:reproductorVC animated:YES];
}


-(UIView *) headerView {
    if (!_headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self
                                    options:nil];
    }
    return _headerView;
}


-(IBAction)agregarPersonaNueva:(id)sender{
    TECPersona *personaNueva = [[TECAlmacenPersona almacenCompartido]creaPersona];
    NSInteger indicePersonaNueva = [[[TECAlmacenPersona almacenCompartido]todasLasPersonas] indexOfObject:personaNueva];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:indicePersonaNueva inSection:0];
    [[self tableView]insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    

}
/*
-(IBAction)cambiaEdicion:(id)sender{

    if([self isEditing]){
        [sender setTitle:@"Editar" forState:UIControlStateNormal]; [self setEditing:NO animated:YES];
    }else {
        [sender setTitle:@"Hecho" forState:UIControlStateNormal]; [self setEditing:YES animated:YES];
    }


}
 */

-(instancetype)init{

    self=[super initWithStyle:UITableViewStylePlain];
    
    TECAlmacenPersona *almacen=[TECAlmacenPersona almacenCompartido];
    if (self) {
        for (int i=1; i<=2; i++) {
            [almacen creaPersona];
        }
        UINavigationItem *navItem = [self navigationItem]; [navItem setTitle:@"Lista Artistas"];
        
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                       target:self action:@selector(agregarPersonaNueva:)];
        [navItem setRightBarButtonItem:barButtonItem];
        [navItem setLeftBarButtonItem:[self editButtonItem]];
    }
    
    return self;
    
}

-(instancetype)initWithStyle:(UITableViewStyle)style{
    return [self init ];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[TECAlmacenPersona almacenCompartido] todasLasPersonas]count];
}


/*
 
 65002954
 
 75002954
 
 
 */


-(void) viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    /*
    UIView *header= [self headerView];
    
    [[self tableView]setTableHeaderView:header];
    */
    
    
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
reuseIdentifier:@"UITableViewCell"];
     */
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    //Se coloca el texto
    NSArray *personas = [[TECAlmacenPersona almacenCompartido]todasLasPersonas];
    TECPersona *persona = personas[indexPath.row];
    [[cell textLabel]setText:[[[persona nombre] stringByAppendingString:@" "]stringByAppendingString:[persona apPaterno]]];
    
    
    NSString *edadPersona= [[NSString alloc]initWithFormat:@"Tiene %d años",[persona edad]];
    [[cell  detailTextLabel]setText:edadPersona];
    
    //NSString *nombreImage= [NSString stringWithFormat:@"Foto%d.jpeg", indexPath.row % 21];
    
    //UIImage *imagen= [UIImage imageNamed:nombreImage];
    
   
    //[[cell imageView]setImage:imagen];
    [[cell imageView]setImage:[persona rutaImagen]];
    
    return cell; }


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        NSArray *items = [[TECAlmacenPersona almacenCompartido]todasLasPersonas]; TECPersona *personaAEliminar = items[indexPath.row];
        [[TECAlmacenPersona almacenCompartido]eliminaPersona:personaAEliminar]; [tableView deleteRowsAtIndexPaths:@[indexPath]
                                                                                                 withRowAnimation:UITableViewRowAnimationMiddle]; }
}



-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{

    TECAlmacenPersona *almacen=[TECAlmacenPersona almacenCompartido];
    
    [almacen moverPersonaFromIndex:sourceIndexPath.row toIndex:destinationIndexPath];

}



@end
