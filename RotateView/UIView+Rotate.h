//
//  UIView+Rotate.h
//  RotateView
//
//  Created by Glenn Posadas on 12/8/20.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, RotateOption) {
  RotateOptionCounterClockwise = -1,
  RotateOptionClockwise        = 1
};

@interface UIView (Rotation)
- (void) startSpinWitRotateOption:(RotateOption)rotateOption;
- (void) stopSpin;
- (void) resetSpinnerState;
@end
