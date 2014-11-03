//
//  ReproductorViewController.h
//  PracticaTableView
//
//  Created by ITESM CCM on 11/1/14.
//  Copyright (c) 2014 ITESM CCM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "TECPersona.h"

@interface ReproductorViewController : UIViewController

@property(nonatomic,retain)AVAudioPlayer *reproductor;
@property(nonatomic)float volumen;
@property(nonatomic,strong) TECPersona *persona;

-(IBAction)play;
-(IBAction)pause;
-(IBAction)stop;


-(IBAction)bajarVol;
-(IBAction)subirVol;

-(IBAction)Aleatoria;


@end
