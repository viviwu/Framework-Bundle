//
//  UIImageView+X.m
//  XKit
//
//  Created by viviwu on 2019/7/15.
//  Copyright © 2019 vivi wu. All rights reserved.
//

#import "UIImageView+X.h"

@implementation UIImageView (X)


//  绘制圆角
-(UIImageView *)roundedRectImageViewWithCornerRadius:(CGFloat)cornerRadius
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bezierPath.CGPath;
    self.layer.mask = layer;
    return self;
}


@end
