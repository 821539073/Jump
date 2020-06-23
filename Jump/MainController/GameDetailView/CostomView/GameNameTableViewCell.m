//
//  GameNameTableViewCell.m
//  Jump
//
//  Created by mac on 2020/6/16.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "GameNameTableViewCell.h"
#import "Masonry.h"
@implementation GameNameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)gameType:(NSArray *)gameTypeArr Chinese:(NSInteger)chineseAll{
    NSInteger arrcount = 0;
    if (chineseAll == 1) {
        arrcount = gameTypeArr.count + 1;
    }else{
        arrcount = gameTypeArr.count;
    }
    UILabel *lastLabel;
    for (int i = 0; i < arrcount; i ++) {
        UILabel *lable = [[UILabel alloc]init];
        [self.view1 addSubview:lable];
        if (chineseAll == 1) {
            if (i == 0) {
                lable.text = @"全区中文";
                lable.backgroundColor = [UIColor redColor];
                [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                    makeLeft(self.view1.mas_left,0);
                    makeTop(self.view1.mas_top, 4);
                    makeHeight(22);
                    makeWidth([self retractLable: @"全区中文"]);
                }];
            }else{
                [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                    
                    makeLeft(lastLabel.mas_right,8);
                    makeTop(self.view1.mas_top, 4);
                    makeHeight(22);
                    makeWidth([self retractLable: gameTypeArr[i - 1]]);
                }];
                lable.text = gameTypeArr[i - 1];
                lable.backgroundColor = [UIColor blackColor];
                //lable.frame
            }
   
        }else{
            [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                if (lastLabel == nil) {
                    makeLeft(self.view1.mas_left, 0);
                }else{
                    makeLeft(lastLabel.mas_right, 8);
                }
                makeTop(self.view1.mas_top, 4);
                makeWidth([self retractLable: gameTypeArr[i]]);
                makeHeight(22);
            }];
            lable.backgroundColor = [UIColor blackColor];
            lable.text = gameTypeArr[i];
        }
        lable.font = [UIFont systemFontOfSize:14];
        lable.textColor = [UIColor whiteColor];
        lable.layer.cornerRadius = 3.0f;
        lable.layer.masksToBounds = YES;
        lable.textAlignment = NSTextAlignmentCenter;
        
        lastLabel = lable;
    }
    
}

-(float )retractLable:(NSString *)string{

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = string;
    label.font = [UIFont systemFontOfSize:14];
    [label sizeToFit];
    //NSLog(@"%f",label.frame.size.width);
    return label.frame.size.width + 10;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
