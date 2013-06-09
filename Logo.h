//
//  Logo.h
//  waitress-logo
//
//  Created by James Hibberd on 09/06/2013.
//  Copyright (c) 2013 James Hibberd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum arcType {
    RIGHT_DOWN, DOWN_LEFT, LEFT_UP, UP_RIGHT
} ArcType;

typedef enum lineDirection {
    RIGHT, DOWN, LEFT, UP
} LineDirection;

@interface Logo : UIView
- (void)line:(CGMutablePathRef)path inDirection:(LineDirection)lineDirection;
- (void)arc:(CGMutablePathRef)path ofType:(ArcType)arcType;
@end
