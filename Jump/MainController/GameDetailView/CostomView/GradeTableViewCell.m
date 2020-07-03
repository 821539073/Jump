//
//  GradeTableViewCell.m
//  Jump
//
//  Created by mac on 2020/6/16.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "GradeTableViewCell.h"

@implementation GradeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bgView.layer.cornerRadius = 6.0f;
    self.bgView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
