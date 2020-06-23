//
//  ChartView.h
//  Jump
//
//  Created by mac on 2020/6/18.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameDisCountModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChartView : UIView

-(id)initWithFrame:(CGRect)frame;


-(void)ChartViewWithData:(GameDisCountModel *)model;
@end

NS_ASSUME_NONNULL_END
