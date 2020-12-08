//
//  UIView+Rotate.m
//  RotateView
//
//  Created by Glenn Posadas on 12/8/20.
//

#import "UIView+Rotate.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Rotation)

BOOL animating;
CGRect frame;

- (void) spinWithOptions: (UIViewAnimationOptions) options andWithRotateOption: (RotateOption) rotateOption {
  self.frame = frame;
  // this spin completes 360 degrees every 2 seconds
  [UIView animateWithDuration: 0.5f
                        delay: 0.0f
                      options: options
                   animations: ^{
    self.transform = CGAffineTransformRotate(self.transform, (int)rotateOption * (M_PI * 0.999));
  }
                   completion: ^(BOOL finished) {
    if (finished) {
      if (animating) {
        // if flag still set, keep spinning with constant speed
        [self spinWithOptions:UIViewAnimationOptionCurveLinear
          andWithRotateOption:rotateOption];
      } else if (options != UIViewAnimationOptionCurveEaseOut) {
        // one last spin, with deceleration
        self.transform = CGAffineTransformIdentity;
      }
    }
  }];
}

/**
 Start the view spinning
 */
- (void) startSpinWitRotateOption:(RotateOption)rotateOption  {
  if (!animating) {
    animating = YES;
    self.layer.anchorPoint = CGPointMake(0.5, 0.5);
    frame = self.frame;
    [self spinWithOptions:UIViewAnimationOptionCurveLinear
      andWithRotateOption:rotateOption];
  }
}

/**
 Stop this view spinning and return to its original position
 */
- (void) stopSpin {
  if(animating) {
    // set the flag to stop spinning after one last 90 degree increment
    animating = NO;
    if(frame.size.width > 0) {
      self.frame = frame;
    }
  }
}

- (void)resetSpinnerState {
  animating = NO;
}
@end
