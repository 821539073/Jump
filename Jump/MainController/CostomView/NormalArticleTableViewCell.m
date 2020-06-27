//
//  NormalArticleTableViewCell.m
//  Jump
//
//  Created by mac on 2020/6/27.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "NormalArticleTableViewCell.h"

@implementation NormalArticleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.textView.scrollEnabled = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
