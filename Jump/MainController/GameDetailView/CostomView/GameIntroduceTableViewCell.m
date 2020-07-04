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

    
}

-(void)addTextWithText:(NSString *)text{
    

    NSString *transfoText = [[text stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    self.yyLable.numberOfLines = 0;
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = 5;
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    [attributes setObject:[UIFont systemFontOfSize:16] forKey:NSFontAttributeName];

    self.yyLable.attributedText = [[NSAttributedString alloc] initWithString:transfoText attributes:attributes];
    [(NSMutableAttributedString *)self.yyLable.attributedText addAttribute:NSKernAttributeName value:@(3) range:NSMakeRange(0, transfoText.length)];

    
    NSString *moreString = @"展开";
    NSMutableAttributedString *temptext = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"...%@", moreString]];
    NSRange expandRange = [temptext.string rangeOfString:moreString];
    
    [temptext addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:expandRange];
    [temptext addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:expandRange];
    
     
    
    YYTextHighlight *hi = [YYTextHighlight new];
    [temptext setTextHighlight:hi range:[temptext.string rangeOfString:moreString]];
    
    //__weak typeof(self) weakSelf = self;
    hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
        //点击展开
        //[weakSelf setFrame:YES];
        NSLog(@"展开-----");
    };
    YYLabel *seeMore = [YYLabel new];
    seeMore.attributedText = temptext;
    [seeMore sizeToFit];
    
    NSAttributedString *truncationToken = [NSAttributedString attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize:seeMore.frame.size alignToFont:temptext.font alignment:YYTextVerticalAlignmentTop];
    
    self.yyLable.truncationToken = truncationToken;
   

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
