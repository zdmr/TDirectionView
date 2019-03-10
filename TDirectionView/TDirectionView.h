//
//  TDirectionView.h
//
//  Created by zdmr on 7.03.2019.
//  Copyright © 2019 TK. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TDirectionView : UIView

@property (nonatomic, strong) IBInspectable UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineHeight;
@property (nonatomic, assign) NSInteger numberOfPoints;

@end
