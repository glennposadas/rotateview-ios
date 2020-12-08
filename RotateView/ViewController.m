//
//  ViewController.m
//  RotateView
//
//  Created by Glenn Posadas on 12/8/20.
//

#import "UIView+Rotate.h"
#import "ViewController.h"

@interface ViewController ()
{
  UIImageView *_v;
  UIButton *_ccw;
  UIButton *_cw;
}
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIImage *image = [UIImage imageNamed:@"ic_sync_green"];
  _v = [[UIImageView alloc] initWithImage:image];
  _v.frame = CGRectMake(0, 0, 100, 100);
  _v.center = self.view.center;
  
  [self.view addSubview:_v];
  
  _ccw = [UIButton buttonWithType:UIButtonTypeSystem];
  [_ccw setTitle:@"CCW" forState:UIControlStateNormal];
  [_ccw addTarget:self action:@selector(rotateCCW) forControlEvents:UIControlEventTouchUpInside];
  _ccw.frame = CGRectMake(_v.frame.origin.x, _v.frame.origin.y + 150.0, 100, 44.0);
  [self.view addSubview:_ccw];
  
  _cw = [UIButton buttonWithType:UIButtonTypeSystem];
  [_cw setTitle:@"CW" forState:UIControlStateNormal];
  [_cw addTarget:self action:@selector(rotateCW) forControlEvents:UIControlEventTouchUpInside];
  _cw.frame = CGRectMake(_v.frame.origin.x, _v.frame.origin.y + 250.0, 100, 44.0);
  [self.view addSubview:_cw];
}

- (void)rotateCCW {
  [_v resetSpinnerState];
  [_v startSpinWitRotateOption:RotateOptionCounterClockwise];
}

- (void)rotateCW {
  [_v resetSpinnerState];
  [_v startSpinWitRotateOption:RotateOptionClockwise];
}

@end
