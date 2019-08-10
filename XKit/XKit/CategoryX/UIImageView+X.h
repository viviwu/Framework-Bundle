//
//  UIImageView+X.h
//  XKit
//
//  Created by viviwu on 2019/7/15.
//  Copyright © 2019 vivi wu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (X)

//圆角效果优化
-(UIImageView *)roundedRectImageViewWithCornerRadius:(CGFloat)cornerRadius;

@end

NS_ASSUME_NONNULL_END
