//
//  ReproductorViewController.m
//  PracticaTableView
//
//  Created by ITESM CCM on 11/1/14.
//  Copyright (c) 2014 ITESM CCM. All rights reserved.
//

#import "ReproductorViewController.h"

@interface ReproductorViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnShakira;
@property (weak, nonatomic) IBOutlet UIButton *btnDavid;
@property (weak, nonatomic) IBOutlet UIImageView *imgCancion;

@end

@implementation ReproductorViewController

@synthesize reproductor;
@synthesize volumen;
@synthesize persona;


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
    // Do any additional setup after loading the view from its nib.
    //[[self nombre]setText:[persona nombre]];
    
    NSString *extension = @".jpg";
    NSString *str2 = [[NSString alloc] initWithFormat:(NSString *)@"%@%@",[persona nombre], extension];
    NSLog(@"Ruta imagen :  %@", str2);
    
    //Esta linea permite que se aprecie la vista completa. 
    self.navigationController.navigationBar.translucent = NO;
    
    //NSString *joinedFromLiterals = [persona nombre] , @".jpg" ;
    
    [self obtenerCancion:[persona nombre] album:str2];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - mis metodos

-(IBAction)play{
    
    if (!reproductor.playing) {
        [reproductor play];
    }
    
    
    
}
-(IBAction)pause{
    
    if (self.reproductor.playing) {
        [reproductor pause];
    }else if (self.reproductor.currentTime!=0){
        
        [reproductor play];
    }
    
}

-(IBAction)stop{
    
    if (self.reproductor.playing) {
        [reproductor stop];
        [self reproductor].currentTime=0;
    }
    
    
}



-(IBAction)cargarCancion{
    
    
    
    NSString *nomCancion=self.btnShakira.titleLabel.text;
    
    NSString *path=[[NSBundle mainBundle]pathForResource:nomCancion ofType:@"mp3"];
    
    NSURL *url=[NSURL fileURLWithPath:path];
    
    self.reproductor=[[AVAudioPlayer alloc]initWithContentsOfURL:url fileTypeHint:nil error:nil];
    
    if (!reproductor.playing) {
        [reproductor play];
    }
    
    
    NSString *nombreImage= [NSString stringWithFormat:@"shakira.jpg"];
    
    UIImage *imagen= [UIImage imageNamed:nombreImage];
    
    [self imgCancion].image=imagen;
    
    
    
}


-(IBAction)cargarCancionDavid{
    
    
    NSString *nomCancion=self.btnDavid.titleLabel.text;
    
    NSString *path=[[NSBundle mainBundle]pathForResource:nomCancion ofType:@"mp3"];
    
    NSURL *url=[NSURL fileURLWithPath:path];
    
    self.reproductor=[[AVAudioPlayer alloc]initWithContentsOfURL:url fileTypeHint:nil error:nil];
    
    if (!reproductor.playing) {
        [reproductor play];
    }
    
    NSString *nombreImage= [NSString stringWithFormat:@"guetta.jpg"];
    
    UIImage *imagen= [UIImage imageNamed:nombreImage];
    
    [self imgCancion].image=imagen;
    
    
    
}

-(IBAction)bajarVol{
    
    if (volumen>0) {
        volumen-=.1;
    }
    
    
    self.reproductor.volume = volumen;
    
    
    
}


-(IBAction)subirVol{
    
    if (volumen<1) {
        volumen+=.1;
    }
    
    
    self.reproductor.volume = volumen;
    
}

-(IBAction)Aleatoria{
    
    NSInteger index = arc4random() % 2;
    
    if (index==0) {
        [self obtenerCancion:@"Shakira" album:@"shakira.jpg"];
        //obtenerCancion(@"Shakira",@"shakira.jpg");
    }else if(index == 1){
        [self obtenerCancion:@"David" album:@"David.jpg"];
        //obtenerCancion(@"David",@@"David");
    }
    
    
    
}
-(void)obtenerCancion:(NSString*)nombreCancion album:(NSString*)imagenCancion{
    
    
    
    NSString *path=[[NSBundle mainBundle]pathForResource:nombreCancion ofType:@"mp3"];
    
    NSURL *url=[NSURL fileURLWithPath:path];
    
    self.reproductor=[[AVAudioPlayer alloc]initWithContentsOfURL:url fileTypeHint:nil error:nil];
    
    if (!reproductor.playing) {
        [reproductor play];
    }
    
    //NSString *imagenNombreCop = imagenCancion+;
    // NSString *nombreImage= [NSString stringWithFormat:];
    
    UIImage *imagen= [UIImage imageNamed:imagenCancion];
    
    [self imgCancion].image=imagen;
    
    
}






@end
