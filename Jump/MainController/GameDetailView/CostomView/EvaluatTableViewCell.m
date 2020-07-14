//
//  EvaluatTableViewCell.m
//  Jump
//
//  Created by mac on 2020/7/7.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "EvaluatTableViewCell.h"
#import <SDWebImage/UIButton+WebCache.h>
#import <SDWebImage/UIImageView+WebCache.h>
@implementation EvaluatTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.commendButton = [[UIButton alloc]init];
    [self.contentView addSubview:self.commendButton];
    self.commendButton.backgroundColor = RGB(252, 235, 233);
    [self.commendButton setTitleColor:RGB(222, 0, 4) forState:UIControlStateNormal];
    [self.commendButton setImageEdgeInsets:UIEdgeInsetsMake(8, 8, 8, 48)];
    [self.commendButton setTitleEdgeInsets:UIEdgeInsetsMake(8, 10, 8, 8)];
    [self.commendButton setImage:[UIImage imageNamed:@"icon_recomm"] forState:UIControlStateNormal];
    self.commendButton.layer.cornerRadius = 4.0f;
    self.commendButton.layer.masksToBounds = YES;
    self.commendButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.commendButton setTitle:@"推荐" forState:UIControlStateNormal];
    
    self.moreButton = [[UIButton alloc]init];
    [self.contentView addSubview:self.moreButton];
    
    self.avatarImageView.layer.cornerRadius = 22.0f;
    self.avatarImageView.layer.masksToBounds = YES;
    
    self.nameAndTimeLabel.numberOfLines = 0;
    
    self.yylabel = [YYLabel new];
    self.yylabel.numberOfLines = 0;
    [self.contentTextBgView addSubview:self.yylabel];
    self.yylabel.backgroundColor = [UIColor redColor];
    [self.yylabel mas_makeConstraints:^(MASConstraintMaker *make) {
        makeEdges(self.contentTextBgView, 5, 5, 88, 5);
    }];
    
}

-(void)commendAndMoreButtonCellStyle1:(Comment *)comment{

    [self.commendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        makeRight(self.contentView.mas_right, -5);
        makeTop(self.contentView.mas_top, 5);
        makeHeight(40);
        makeWidth(80);
    }];
    
    self.moreButton.hidden = YES;
    
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:comment.avatarUrl]];
    [self.nameAndTimeLabel setAttributedText:[self linebreakWithName:comment.nickname createTime:comment.createTime]];
    
    for (Content *tempcontent in comment.content) {
        if ([tempcontent.type isEqualToString:@"text"]) {
            
            [self.yylabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                makeEdges(self.contentTextBgView, 5, 5, 5, 5);
            }];
            
            NSMutableAttributedString *text1 = [NSMutableAttributedString new];
            [text1 appendAttributedString:[[NSAttributedString alloc] initWithString:tempcontent.text attributes:nil]];
             text1.font = [UIFont systemFontOfSize:16];
             self.yylabel.attributedText = text1;
             NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"...查看更多"];
             YYTextHighlight *hi = [YYTextHighlight new];
             [hi setColor:[UIColor colorWithRed:0.578 green:0.790 blue:1.000 alpha:1.000]];
             hi.tapAction = ^(UIView *containerView,NSAttributedString *text,NSRange range, CGRect rect) {

                 /*self.yyLable.truncationToken = nil;
                 
                 if (self.delegate && [self.delegate respondsToSelector:@selector(reloadTableViewCellHeight)]) {
                     [self.delegate reloadTableViewCellHeight];
                 } */
                 
             };
                
             [text setColor:[UIColor colorWithRed:0.000 green:0.449 blue:1.000 alpha:1.000] range:[text.string rangeOfString:@"查看更多"]];
                
             [text setTextHighlight:hi range:[text.string rangeOfString:@"查看更多"]];
             text.font =self.yylabel.font;
                
             YYLabel *seeMore = [YYLabel new];
             seeMore.attributedText = text;
             [seeMore sizeToFit];
                

             NSAttributedString *truncationToken = [NSAttributedString attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize:seeMore.frame.size alignToFont:text.font alignment:YYTextVerticalAlignmentCenter];
             self.yylabel.truncationToken = truncationToken;
        }else if ([tempcontent.type isEqualToString:@"image"]){
            UIImageView *image = [[UIImageView alloc]init];
            [self.contentTextBgView addSubview:image];
            image.backgroundColor = [UIColor redColor];
            [image mas_makeConstraints:^(MASConstraintMaker *make) {
                makeBottom(self.contentTextBgView.mas_bottom, -5);
                makeLeft(self.contentTextBgView.mas_left, 5);
                make.width.mas_equalTo(self.contentTextBgView).with.multipliedBy(0.618);
                makeTop(self.yylabel.mas_bottom, 5);
            }];
            
            [self.yylabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                makeEdges(self.contentTextBgView, 5, 5, 88, 5);
            }];
            
        }
    }
    
    
    

}

-(void)commendAndMoreButtonCellStyle2:(Comment *)comment{
    
    
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        makeRight(self.contentView.mas_right, -5);
        makeTop(self.contentView.mas_top, 14);
        makeHeight(22);
        makeWidth(22);
    }];
    
    self.moreButton.backgroundColor = [UIColor redColor];
    
    

    [self.commendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        makeRight(self.moreButton.mas_left, -5);
        makeTop(self.contentView.mas_top, 5);
        makeHeight(40);
        make.width.mas_equalTo(self.contentView.mas_width).multipliedBy(0.2);
    }];
    
    self.commendButton.backgroundColor = [UIColor redColor];
    
}

-(NSMutableAttributedString *)linebreakWithName:(NSString *)name createTime:(NSString *)createTime{
    NSString *tempString =[NSString stringWithFormat:@"%@\n%@",name,createTime];
    NSMutableAttributedString *temprecommStr = [[NSMutableAttributedString alloc]initWithString:tempString];
     //NSLog(@"%@",tempPriceStr);
     //1段
    [temprecommStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, name.length)];
    [temprecommStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, name.length)];
    return temprecommStr;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
