//
//  ToolsListTableViewCell.m
//  Jump
//
//  Created by mac on 2020/6/29.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "ToolsListTableViewCell.h"

@implementation ToolsListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.optionLabel.layer.cornerRadius = 6.0f;
    self.optionLabel.layer.masksToBounds = YES;
}

-(void)cellStyle1{
    
    self.cellNameLabel.hidden = NO;
    self.cellPicLabel.hidden = NO;
    self.optionLabel.hidden = YES;
    self.line.hidden = NO;
}

-(void)cellStyle2{
    
    self.cellNameLabel.hidden = YES;
    self.cellPicLabel.hidden = YES;
    self.optionLabel.hidden = NO;
    self.line.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
