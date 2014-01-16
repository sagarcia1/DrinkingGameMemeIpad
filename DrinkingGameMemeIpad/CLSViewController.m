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
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{

    if (event.type == UIEventSubtypeMotionShake) {
        int num = [self getRandomNumberBetween:1 to:1];
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
    
   
    UIButton *btmove = (UIButton *) [self.view viewWithTag:self.posbotao];
  
    float x = btmove.center.x;
    
    float y = btmove.center.y;
    
    NSLog(@"%f x" , x);
    
    [btmove setHidden:YES];

    UIButton *btfecha  = (UIButton *)[self.view viewWithTag:self.posAnterior];
    NSLog(@"%d botao", self.posAnterior);
    
    [UIButton animateWithDuration:1.0 animations:^{btfecha.center = CGPointMake(x, y);}];
    [btfecha setHidden:NO];
  
}
@end
