//
//  CardTableViewCell.m
//  Jump
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "CardTableViewCell.h"

@implementation CardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.gamePic.layer.cornerRadius = 4.0f;
    self.gamePic.layer.masksToBounds = YES;
    self.GradeLabel.layer.borderWidth = 2;
    self.GradeLabel.layer.borderColor = RGB(235, 187, 89).CGColor;
    self.GradeLabel.layer.masksToBounds = YES;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.surplusLable.bounds.size.width * 1/6, 0.f)];
    [path addLineToPoint:CGPointMake(self.surplusLable.bounds.size.width, 0)];
    [path addLineToPoint:CGPointMake(self.surplusLable.bounds.size.width, self.surplusLable.bounds.size.height)];
    [path addLineToPoint:CGPointMake(0.f, self.surplusLable.bounds.size.height)];
    [path addLineToPoint:CGPointMake(self.surplusLable.bounds.size.width * 1/6, 0.f)];
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    shapLayer.path = path.CGPath;
    self.surplusLable.layer.mask = shapLayer;
    [path closePath];
    self.surplusLable.layer.cornerRadius = 4.0f;
    self.surplusLable.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
