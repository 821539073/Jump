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
    self.bgview.layer.cornerRadius = 6.0f;
    self.bgview.layer.masksToBounds = YES;
    //self.bgview.layer.borderWidth = 4.0f;
    //self.bgview.layer.borderColor = [UIColor grayColor].CGColor;
    //self.bgview.layer.shadowColor = [UIColor grayColor].CGColor;
    //self.bottomBGview.layer.shadowOffset = cg
    
    self.commentButton.layer.cornerRadius = 2.0f;
    self.commentButton.layer.masksToBounds = YES;
    
    self.unCommentButton.layer.cornerRadius = 2.0f;
    self.unCommentButton.layer.masksToBounds = YES;
    
}

-(void)cellStyle1{
    
    self.centerLable.textAlignment = NSTextAlignmentCenter;
    self.centerLable.textColor = [UIColor redColor];
    self.topTitleLable.text = @"拥有这款游戏了？";
    self.centerLable.text = @"你是否推荐这款游戏？";
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
