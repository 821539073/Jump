//
//  GameDiscountTableViewCell.h
//  Jump
//
//  Created by mac on 2020/6/18.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameDisCountModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameDiscountTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *openLable;
@property (weak, nonatomic) IBOutlet UIImageView *openLabel;
@property (weak, nonatomic) IBOutlet UIView *bgview1;


-(void)ChartViewData:(GameDisCountModel *)model;
@end

NS_ASSUME_NONNULL_END
