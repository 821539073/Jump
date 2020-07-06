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
    self.yyLable.userInteractionEnabled = YES;
    self.yyLable.numberOfLines = 0;

    
}

-(void)addTextWithText:(NSString *)deatilText{
    //NSString *transfoText = [[deatilText stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSMutableAttributedString *text1 = [NSMutableAttributedString new];
    [text1 appendAttributedString:[[NSAttributedString alloc] initWithString:deatilText attributes:nil]];
    text1.font = [UIFont systemFontOfSize:16];
    self.yyLable.attributedText = text1;
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"...全文"];
    YYTextHighlight *hi = [YYTextHighlight new];
    [hi setColor:[UIColor colorWithRed:0.578 green:0.790 blue:1.000 alpha:1.000]];
    hi.tapAction = ^(UIView *containerView,NSAttributedString *text,NSRange range, CGRect rect) {

        self.yyLable.truncationToken = nil;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(reloadTableViewCellHeight)]) {
            [self.delegate reloadTableViewCellHeight];
        }
        
        

    };
       
       
    [text setColor:[UIColor colorWithRed:0.000 green:0.449 blue:1.000 alpha:1.000] range:[text.string rangeOfString:@"全文"]];
       
    [text setTextHighlight:hi range:[text.string rangeOfString:@"全文"]];
    text.font =self.yyLable.font;
       
    YYLabel *seeMore = [YYLabel new];
    seeMore.attributedText = text;
    [seeMore sizeToFit];
       

    NSAttributedString *truncationToken = [NSAttributedString attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize:seeMore.frame.size alignToFont:text.font alignment:YYTextVerticalAlignmentCenter];
       
    self.yyLable.truncationToken = truncationToken;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
