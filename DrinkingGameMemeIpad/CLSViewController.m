//
//  CLSViewController.m
//  DrinkingGameMemeIpad
//
//  Created by Celo on 16/01/14.
//  Copyright (c) 2014 Celo. All rights reserved.
//

#import "CLSViewController.h"

@interface CLSViewController ()

@end

@implementation CLSViewController

-(int)getRandomNumberBetween:(int)from to:(int)to
{

    return (int)from + arc4random() %( to -from  +1);
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.posbotao = 0;
    self.posAnterior = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{

    if (event.type == UIEventSubtypeMotionShake) {
        int num = [self getRandomNumberBetween:1 to:6];
        NSLog(@"%d dado", num);
        self.numberDado  = (int)num;
        [self move];
    }
    
    
}


-(void)move{
    if (self.posbotao == 0 ) {
           self.posbotao = 1;
    }
 
     self.posAnterior = self.posbotao;
   
    
    self.posbotao = self.posbotao + self.numberDado;
    
    UIBezierPath *aPath= [UIBezierPath bezierPath];
    UIBarButtonItem *endPath = [UIBezierPath bezierPath];
    
   
        
        UIButton *btmove = (UIButton *) [self.view viewWithTag:self.posbotao];
        
        float x = btmove.center.x;
        
        float y = btmove.center.y;
    
    
        NSLog(@"%f x" , x);
        
        [btmove setHidden:YES];
        
        UIButton *btfecha  = (UIButton *)[self.view viewWithTag:self.posAnterior];
        NSLog(@"%d botao", self.posbotao);
        [btfecha setHidden:NO];
    CABasicAnimation *animacao = [CABasicAnimation animationWithKeyPath:@"path"];
    animacao.fromValue = aPath CGPath(x,y);
   
        if (self.posbotao>=31) {
            UIButton *btwin = (UIButton *)[self.view viewWithTag:31];
            float x1 = btwin.center.x;
            float y1 = btwin.center.y;
            [UIButton animateWithDuration:1.0 animations:^{[aPath moveToPoint:CGPointMake(x1,y1)];}completion:^(BOOL finished){
                [btwin setHidden:YES];
                [btfecha setHidden:YES];
                [btmove setHidden:NO];
                NSLog(@"%f x final",x);
               
    
                
             
                
                
                NSLog(@"%d",self.posbotao);
                }];
            
          
                       UIAlertView *alerta = [[UIAlertView alloc]initWithTitle:@"Ganhou" message:@"Deseja jogar de novo?" delegate:nil cancelButtonTitle:@"Sim" otherButtonTitles:nil,nil];
            
               [alerta show];
            
            self.posbotao = 1;
            self.posAnterior = 0;
            
        
            
            
            
        }
    
    }
  
    
  

@end
