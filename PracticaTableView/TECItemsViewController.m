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

#pragma mark - Constructores

-(instancetype)init{
    
    self=[super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        
    }
    
    return self;
    
}

-(instancetype)initWithStyle:(UITableViewStyle)style{
    return [self init ];
}

#pragma mark - Ciclo de vida del view controller

-(void) viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - TableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"Shakira";
            break;
        case 1:
            cell.textLabel.text = @"David";
        default:
            break;
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

#pragma mark - TableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ruta = nil;

    switch (indexPath.row)
    {
        case 0:
            ruta = @"Shakira.jpg";
            break;
        case 1:
            ruta = @"David.jpg";
            break;
        default:
            break;
    }
    ReproductorViewController *reproductorVC=[[ReproductorViewController alloc]init];
    [reproductorVC setPersona:[[TECPersona alloc] initWithNombre:[tableView cellForRowAtIndexPath:indexPath].textLabel.text foto:[UIImage imageNamed:ruta]]];
    [[self navigationController]pushViewController:reproductorVC animated:YES];
    
}








@end
