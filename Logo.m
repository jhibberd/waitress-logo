//
//  Logo.m
//  waitress-logo
//
//  Created by James Hibberd on 09/06/2013.
//  Copyright (c) 2013 James Hibberd. All rights reserved.
//

#import "Logo.h"

#define UNIT_SIZE 20
#define LINE_WIDTH 5.0

@implementation Logo

- (void)drawRect:(CGRect)rect
{
    // fill canvas red and prepare context for hand path
    UIColor *backgroundColor = [UIColor colorWithHue:4 saturation:78 brightness:87 alpha:1];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGContextFillRect(context, self.bounds);
    CGContextSaveGState(context);
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetStrokeColorWithColor(context, backgroundColor.CGColor);
    CGContextSetLineWidth(context, LINE_WIDTH);
    
    // define hand path starting coordinates
    // TODO(jhibberd) magic number!
    CGFloat x = 115;
    CGFloat y = rect.size.height + LINE_WIDTH;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, x, y);
    
    // build hand path
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self line:path inDirection:LEFT];
    [self line:path inDirection:LEFT];
    [self arc:path ofType:LEFT_UP];
    [self line:path inDirection:UP];    // thumb
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self arc:path ofType:UP_RIGHT];
    [self arc:path ofType:RIGHT_DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:UP];    // finger 1
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self arc:path ofType:UP_RIGHT];
    [self arc:path ofType:RIGHT_DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:UP];    // finger 2
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self arc:path ofType:UP_RIGHT];
    [self arc:path ofType:RIGHT_DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:UP];    // finger 3
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self arc:path ofType:UP_RIGHT];
    [self arc:path ofType:RIGHT_DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:UP];    // finger 4
    [self line:path inDirection:UP];
    [self line:path inDirection:UP];
    [self arc:path ofType:UP_RIGHT];
    [self arc:path ofType:RIGHT_DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self arc:path ofType:DOWN_LEFT];   // close hand
    [self line:path inDirection:LEFT];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    [self line:path inDirection:DOWN];
    
    // stroke and fill the hand path then cleanup the context
    CGPathCloseSubpath(path);
    CGContextAddPath(context, path);    
    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextRestoreGState(context);
}

- (void)line:(CGMutablePathRef)path inDirection:(LineDirection)lineDirection
{
    CGPoint currentPoint = CGPathGetCurrentPoint(path);
    CGFloat x, y;
    switch (lineDirection) {
        case RIGHT:
            x = currentPoint.x + UNIT_SIZE;
            y = currentPoint.y;
            break;
        case DOWN:
            x = currentPoint.x;
            y = currentPoint.y + UNIT_SIZE;
            break;
        case LEFT:
            x = currentPoint.x - UNIT_SIZE;
            y = currentPoint.y;
            break;
        case UP:
            x = currentPoint.x;
            y = currentPoint.y - UNIT_SIZE;
            break;
    }
    CGPathAddLineToPoint(path, NULL, x, y);
}

- (void)arc:(CGMutablePathRef)path ofType:(ArcType)arcType
{
    CGPoint currentPoint = CGPathGetCurrentPoint(path);
    CGFloat x1, y1, x2, y2;
    switch (arcType) {
        case RIGHT_DOWN:
            x1 = currentPoint.x + UNIT_SIZE;
            y1 = currentPoint.y;
            x2 = currentPoint.x + UNIT_SIZE;
            y2 = currentPoint.y + UNIT_SIZE;
            break;
        case DOWN_LEFT:
            x1 = currentPoint.x;
            y1 = currentPoint.y + UNIT_SIZE;
            x2 = currentPoint.x - UNIT_SIZE;
            y2 = currentPoint.y + UNIT_SIZE;
            break;
        case LEFT_UP:
            x1 = currentPoint.x - UNIT_SIZE;
            y1 = currentPoint.y;
            x2 = currentPoint.x - UNIT_SIZE;
            y2 = currentPoint.y - UNIT_SIZE;
            break;
        case UP_RIGHT:
            x1 = currentPoint.x;
            y1 = currentPoint.y - UNIT_SIZE;
            x2 = currentPoint.x + UNIT_SIZE;
            y2 = currentPoint.y - UNIT_SIZE;
            break;
    }
    CGPathAddArcToPoint(path, NULL, x1, y1, x2, y2, UNIT_SIZE);
}

@end
