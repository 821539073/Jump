//
//  IsHaveGameTableViewCell.m
//  Jump
//
//  Created by mac on 2020/7/4.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "IsHaveGameTableViewCell.h"

@implementation IsHaveGameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomBGview.layer.cornerRadius = 6.0f;
    self.bottomBGview.layer.shadowColor = [UIColor grayColor].CGColor;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
