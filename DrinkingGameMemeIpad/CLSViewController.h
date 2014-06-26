//
//  CLSViewController.h
//  DrinkingGameMemeIpad
//
//  Created by Celo on 16/01/14.
//  Copyright (c) 2014 Celo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<CoreLocation/CoreLocation.h>

@interface CLSViewController : UIViewController<UICollisionBehaviorDelegate,CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *gesture;
-(int)getRandomNumberBetween:(int) from to:(int)to;
- (IBAction)tapAction:(UITapGestureRecognizer *)sender;
- (IBAction)btInicio:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *FIRSTVIEW;
@property (nonatomic) NSInteger numberDado;
@property (nonatomic)NSInteger posbotao;
@property (nonatomic)NSInteger posAnterior;
@property (strong, nonatomic)UIButton *btInicio;
@property (strong,nonatomic)UIButton *btfim;
- (void) moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;
@property (weak, nonatomic) IBOutlet UIButton *btInicial;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;
@property (strong, nonatomic) IBOutlet UIView *view3;
@property (strong, nonatomic) IBOutlet UIButton *btTroll;
@property (strong, nonatomic) IBOutlet UIView *view0;
@property (strong, nonatomic) CLBeaconRegion *myBeaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet UIView *container;
@property (strong,nonatomic) NSNumber *dadoNumber;


@property (strong, nonatomic) IBOutlet UIImageView *dado;


@end
