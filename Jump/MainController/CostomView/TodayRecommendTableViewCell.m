//
//  TodayRecommendTableViewCell.m
//  Jump
//
//  Created by mac on 2020/6/20.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "TodayRecommendTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation TodayRecommendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.gamePic.layer.cornerRadius = 8.0f;
    self.gamePic.layer.masksToBounds = YES;
    self.gamePic.contentMode = UIViewContentModeScaleToFill;
    
    self.userProfilePic.layer.cornerRadius = 15;
    self.userProfilePic.layer.masksToBounds = YES;
    
    self.checkRecommendButton.layer.cornerRadius = 21/2;
    self.checkRecommendButton.layer.masksToBounds = YES;
    
    
    CAGradientLayer *gradint = [CAGradientLayer layer];
    gradint.frame = CGRectMake(0, 0, DeviceWidth - 10, 180);

    
    gradint.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] colorWithAlphaComponent:0].CGColor, (id)[[UIColor blackColor] colorWithAlphaComponent:0.3].CGColor,nil];
    [self.gamePic.layer insertSublayer:gradint atIndex:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
