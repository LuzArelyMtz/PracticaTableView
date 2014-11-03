//
//  TECDetallePersonaViewController.m
//  PracticaTableView
//
//  Created by ITESM CCM on 10/18/14.
//  Copyright (c) 2014 ITESM CCM. All rights reserved.
//

#import "TECDetallePersonaViewController.h"
#import "TECPersona.h"
@interface TECDetallePersonaViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nombre;
@property (weak, nonatomic) IBOutlet UITextField *apPaterno;
@property (weak, nonatomic) IBOutlet UITextField *edad;
@property (weak, nonatomic) IBOutlet UILabel *fechaAlta;
@end

@implementation TECDetallePersonaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    
    if (self) {
       UINavigationItem *navItem = [self navigationItem]; [navItem setTitle:@"Detalle"];
    }
    return self;
}


-(void)setPersona:(TECPersona *)persona{
    _persona=persona;
    UINavigationItem *navItem=[self navigationItem];
    [navItem setTitle:[persona nombre]];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //Se limpia el firstResponder (para que desaparezca el teclado
    [self.view endEditing:YES];
    //Se guardan los cambios
    TECPersona *persona = [self persona]; [persona setNombre:[[self nombre]text]]; [persona setApPaterno:[[self apPaterno]text]]; NSString *edadStr = [[self edad]text];
    int edad = [edadStr integerValue];
    [persona setEdad:edad];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    TECPersona *persona = [self persona];
    [[self nombre]setText:[persona nombre]];
    [[self apPaterno]setText:[persona apPaterno]];
    [[self edad]setText:[NSString stringWithFormat:@"%d",[persona
                                                          edad]]];
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateStyle = NSDateFormatterMediumStyle;
    df.timeStyle = NSDateFormatterNoStyle;
    [[self fechaAlta]setText:[df stringFromDate:[persona
                                                 fechaAlta]]]; }

@end
