//
//  GameIntroduceTableViewCell.m
//  Jump
//
//  Created by mac on 2020/6/16.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "GameIntroduceTableViewCell.h"


@implementation GameIntroduceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
   // self.yyLable.text = @"sasasasasasas";

    
    
}

-(void)addTextWithText:(NSString *)text{
    UIFont *font16 = [UIFont systemFontOfSize:16];
    self.yyLable.attributedText = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName : font16}];

    NSString *moreString = @" 展开";
    NSMutableAttributedString *temptext = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"... %@", moreString]];
    NSRange expandRange = [temptext.string rangeOfString:moreString];
    
    [temptext addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:expandRange];
    [temptext addAttribute:NSForegroundColorAttributeName value:[UIColor darkTextColor] range:NSMakeRange(0, expandRange.location)];
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
