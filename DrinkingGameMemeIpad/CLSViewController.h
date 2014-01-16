//
//  CLSViewController.h
//  DrinkingGameMemeIpad
//
//  Created by Celo on 16/01/14.
//  Copyright (c) 2014 Celo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLSViewController : UIViewController
-(int)getRandomNumberBetween:(int) from to:(int)to;
@property (nonatomic) NSInteger numberDado;
@property (nonatomic)NSInteger posbotao;
@property (nonatomic)NSInteger posAnterior;
@property (strong, nonatomic)UIButton *btInicio;
@property (strong,nonatomic)UIButton *btfim;
- (void) moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;



@end
