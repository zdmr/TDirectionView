//
//  TDirectionView.m
//
//  Created by zdmr on 7.03.2019.
//  Copyright © 2019 TK. All rights reserved.
//

#import "TDirectionView.h"

@implementation TDirectionView

- (void)setNumberOfPoints:(NSInteger)numberOfPoints {
    _numberOfPoints = numberOfPoints;
    [self setNeedsDisplay];
}

- (void)setLineHeight:(CGFloat)lineHeight {
    _lineHeight = lineHeight;
    [self setNeedsDisplay];
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    CGFloat _circleHeight = CGRectGetHeight(rect);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat distanceBetweenCircles = (width - _numberOfPoints * _circleHeight) / (_numberOfPoints - 1) * 1.0;
    
    CGFloat xCursor = 0;
    
    CGContextSetLineWidth(context, _lineHeight);
    CGContextSetStrokeColorWithColor(context, _lineColor.CGColor);
    CGContextMoveToPoint(context, _circleHeight / 2.0, height / 2.0);
    CGContextAddLineToPoint(context, width - _circleHeight / 2.0, height / 2.0);
    CGContextStrokePath(context);
    
    CGPoint centerPoints[_numberOfPoints];
    
    for (int i = 0; i < _numberOfPoints; i++) {
        centerPoints[i] = CGPointMake(xCursor, (height - _circleHeight) / 2);
        xCursor += _circleHeight + distanceBetweenCircles;
    }
    
    for (int i = 0; i < _numberOfPoints; i++) {
        
        CGRect rectangle = {centerPoints[i], CGSizeMake(_circleHeight, _circleHeight)};
        CGContextAddEllipseInRect(context, rectangle);
        
        if (i == 0 || i == _numberOfPoints - 1) {
            
            CGContextSetFillColorWithColor(context, _lineColor.CGColor);
            CGContextFillPath(context);
        } else {
            
            CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
            CGContextFillPath(context);
            
            CGContextSetLineWidth(context, 1);
            CGRect circle = CGRectInset(rectangle, 1, 1);
            CGContextAddEllipseInRect(context, circle);
            CGContextStrokePath(context);
        }
    }
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    _numberOfPoints = 3;
}

- (void)commonInit {
    
    if (self.backgroundColor && ![self.backgroundColor isEqual:[UIColor clearColor]]) {
        _lineColor = self.backgroundColor;
        self.backgroundColor = [UIColor clearColor];
    }
    _lineHeight = 2;
    _numberOfPoints = MAX(_numberOfPoints, 2);
    [self setContentMode:UIViewContentModeRedraw];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self commonInit];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

@end
