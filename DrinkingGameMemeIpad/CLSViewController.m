//
//  CLSViewController.m
//  DrinkingGameMemeIpad
//
//  Created by Celo on 16/01/14.
//  Copyright (c) 2014 Celo. All rights reserved.
//


//TODO CONSEGUI FAZER O DADO GIRAR UMA VEZ APENAS COLOCANDO O A TASK  DE STOPMONITORATION, MAS O PROBLEMA [E QUE EU QUERO QUE ABRA O IBEACON NOVAMENTE APOS EU FAZER A ACTION

#import "CLSViewController.h"


@interface CLSViewController ()
@property (nonatomic,strong) UIDynamicAnimator *animator;
@property (nonatomic,strong) UISnapBehavior *snap;
@property (nonatomic,strong)UIGravityBehavior *gravity;
@property (nonatomic)NSInteger pulaCasa;
@property (nonatomic,strong) UICollisionBehavior *collisor;
@property (nonatomic,strong)UIDynamicItemBehavior *item;
@property (nonatomic,strong)UIPushBehavior *push;


@end

@implementation CLSViewController
{
    NSString *major;
    NSInteger minor;
    NSInteger antMinor;
}

-(int)getRandomNumberBetween:(int)from to:(int)to
{

    return (int)from + arc4random() %( to -from  +1);
    
    
}

- (IBAction)tapAction:(UITapGestureRecognizer *)sender {
}

- (IBAction)btInicio:(UIButton *)sender {
    [self menu];
    
}

-(void)menu
{
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    self.gravity = [[UIGravityBehavior alloc] initWithItems:@[self.FIRSTVIEW ]];
    CGVector  gravidade= {0,-1};
    
    self.gravity.gravityDirection = gravidade;
    [self.animator addBehavior: self.gravity];
    if (gravidade.dy <= -1) {
        [self.animator addBehavior:self.gravity];
        NSLog(@"BOMBOU");
    }

}
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.posbotao = 0;
    self.posAnterior = 0;
 
    self.collisor.collisionDelegate = self;
    
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    NSUUID *uuid = [[NSUUID alloc]initWithUUIDString:@"D654791D-4980-46A3-9B24-CD23318E7F83"];
    self.myBeaconRegion = [[CLBeaconRegion alloc]initWithProximityUUID:uuid identifier:@"bepid.DrinkinMemeDado"];
    [self.locationManager startMonitoringForRegion:self.myBeaconRegion];
    
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    [self.locationManager startRangingBeaconsInRegion:self.myBeaconRegion];

    NSLog(@"funcionando");
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    [self.locationManager stopRangingBeaconsInRegion:self.myBeaconRegion];
    NSLog(@"Nao bombou");
}
-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    NSLog(@"BOMBOU");
    CLBeacon *foundbeacon = [beacons firstObject];
 
    major = [NSString stringWithFormat:@"%@",foundbeacon.minor];
    NSNumber *minornum = foundbeacon.major;
    minor = [minornum integerValue];

    
    NSLog(@"MAJOR %@",major);
    if (antMinor != minor) {
        [self moveBluetooth];
        antMinor = minor;
    }
    else
    {
        NSLog(@"Nao foi");
    }
   
  //  [self.locationManager stopRangingBeaconsInRegion:self.myBeaconRegion];
    //[self.locationManager stopUpdatingLocation];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{

    if (event.type == UIEventSubtypeMotionShake) {
         [self.dado setHidden:NO];
        self.dado.center = CGPointMake(200, 200);
        self.dado.alpha= 1;
   
        int num = [self getRandomNumberBetween:2 to:6];
        NSLog(@"%d dado", num);
      self.numberDado  = [major intValue];
        UIDynamicAnimator *animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
        self.animator = animator;
        [UIView animateWithDuration:4.0 animations:^{
           
            
            self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view] ;
            self.gravity = [[UIGravityBehavior alloc]initWithItems:@[self.dado]];
            self.collisor = [[UICollisionBehavior alloc]initWithItems:@[self.dado]];
            self.collisor.translatesReferenceBoundsIntoBoundary = YES;
            self.item = [[UIDynamicItemBehavior alloc]initWithItems:@[self.dado]];
            self.push = [[UIPushBehavior alloc]initWithItems:@[self.dado] mode:UIPushBehaviorModeContinuous ];
            [self.push    setPushDirection:CGVectorMake(2.0, 4.0)];
    
            self.item.elasticity = 0.6;
            self.item.allowsRotation=YES;
            self.item.density = 2;
          
            
            
            [self.animator addBehavior:self.push];
            [self.animator addBehavior:self.collisor];
            [self.animator addBehavior:self.gravity];
            [self.animator addBehavior:self.item];
            
        } completion:^(BOOL finished) {
            if (finished) {
               [ UIView animateWithDuration:2.5 delay:2.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                      self.dado.alpha = 0;
                   
                   if (self.numberDado == 1) {
                         self.dado.image = [UIImage imageNamed:@"DADO_1.png"];
                       
                   }
                  else if (self.numberDado == 2) {
                       self.dado.image = [UIImage imageNamed:@"DADO_2.png"];
                   }
                   else if (self.numberDado == 3) {
                       self.dado.image = [UIImage imageNamed:@"DADO_3.png"];
                   }
                  else if (self.numberDado == 4) {
                       self.dado.image = [UIImage imageNamed:@"DADO_4.png"];
                   }
                  else if (self.numberDado == 5) {
                       self.dado.image = [UIImage imageNamed:@"DADO_5.png"];
                   }
                   else if (self.numberDado == 6) {
                       self.dado.image = [UIImage imageNamed:@"DADO_6.png"];
                   }
                  
                  

                  
               } completion:^(BOOL finished){
                  
                   [self move];
                   
               }];
               
             //    [self performSelector:@selector(move) withObject:self afterDelay:4.0];
                
            }
        
           
            
            
            
            
        
        }];
        
        
      
    
    
    
         }
    
         }
         

-(void)move{
    
 
  
    self.posbotao = self.posbotao + self.numberDado;
    if (self.posbotao ==0) {
        self.posbotao =1;
    }
    
 
        for (int i = 0 ; self.pulaCasa<=self.posbotao; i++) {
            
            NSInteger tag =self.pulaCasa;
            
            UIView *viewRecebe =(UIView*)[self.view viewWithTag:tag];
            
            
            CGPoint point = viewRecebe.center;
            [self.animator removeBehavior:self.snap];
            UISnapBehavior *snap = [[UISnapBehavior alloc]initWithItem:self.btTroll snapToPoint:point ];
            snap.damping = 2.0;
            
            [self.animator addBehavior:snap];
            self.snap = snap;
          
            
            
           
            if (self.pulaCasa<=30) {
                self.pulaCasa++;
                
//                 NSLog(@"%d BOTAO",self.posbotao);
//                NSLog(@"%d PULA CASA",self.pulaCasa);
            }else
            {
                 [self alert];
                UIView *viewInicio = (UIView*)[self.view viewWithTag:0];
                CGPoint pointInicio = viewInicio.center;
                [self. animator removeBehavior:self.snap];
                UISnapBehavior *snapInicio = [[UISnapBehavior alloc]initWithItem:self.btTroll snapToPoint:pointInicio];
                [self.animator addBehavior:snapInicio];
                self.snap = snapInicio;
                
                
                self.pulaCasa = 0;
                self.posbotao = 1;
//                
//                NSLog(@"%d BOTAO FINAL",self.posbotao);
//                NSLog(@"%d PULA CASA FINAL",self.pulaCasa);

              
            }
            
            
            

        
    }
       
        
        
    
    
    }
    









 -(void)alert
{
    
    
    UIAlertView *gameOver = [[UIAlertView alloc]initWithTitle:@"Você Venceu!" message:@"Parabéns" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//  self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
//  self.gravity = [[UIGravityBehavior alloc]initWithItems:@[gameOver]];
//    
//    [self.animator addBehavior:self.gravity];
    [gameOver show];
    
    
}
    
#pragma mark - move BLuetooth

-(void)moveBluetooth
{
    [self.dado setHidden:NO];
    self.dado.center = CGPointMake(200, 200);
    self.dado.alpha= 1;
    

        self.numberDado= [major intValue];
    
  
    
   

    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    self.animator = animator;
    [UIView animateWithDuration:4.0 animations:^{
        
        
        self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view] ;
        self.gravity = [[UIGravityBehavior alloc]initWithItems:@[self.dado]];
        self.collisor = [[UICollisionBehavior alloc]initWithItems:@[self.dado]];
        self.collisor.translatesReferenceBoundsIntoBoundary = YES;
        self.item = [[UIDynamicItemBehavior alloc]initWithItems:@[self.dado]];
        self.push = [[UIPushBehavior alloc]initWithItems:@[self.dado] mode:UIPushBehaviorModeContinuous ];
        [self.push    setPushDirection:CGVectorMake(2.0, 4.0)];
        
        self.item.elasticity = 0.6;
        self.item.allowsRotation=YES;
        self.item.density = 2;
        
        
        
        [self.animator addBehavior:self.push];
        [self.animator addBehavior:self.collisor];
        [self.animator addBehavior:self.gravity];
        [self.animator addBehavior:self.item];
        
    } completion:^(BOOL finished) {
        if (finished) {
            [ UIView animateWithDuration:2.5 delay:2.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.dado.alpha = 0;
                
                if (self.numberDado == 1) {
                    self.dado.image = [UIImage imageNamed:@"DADO_1.png"];
                    
                }
                else if (self.numberDado == 2) {
                    self.dado.image = [UIImage imageNamed:@"DADO_2.png"];
                }
                else if (self.numberDado == 3) {
                    self.dado.image = [UIImage imageNamed:@"DADO_3.png"];
                }
                else if (self.numberDado == 4) {
                    self.dado.image = [UIImage imageNamed:@"DADO_4.png"];
                }
                else if (self.numberDado == 5) {
                    self.dado.image = [UIImage imageNamed:@"DADO_5.png"];
                }
                else if (self.numberDado == 6) {
                    self.dado.image = [UIImage imageNamed:@"DADO_6.png"];
                }
                
                
                
                
            } completion:^(BOOL finished){
                
                [self move];
                
                
            }];
            
            //    [self performSelector:@selector(move) withObject:self afterDelay:4.0];
            
        }
        
        
        
        
        
        
        
    }];
    
    
    
    
    
    
}
            


  
    
  

@end
