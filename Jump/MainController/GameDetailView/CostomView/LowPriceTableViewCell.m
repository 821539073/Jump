//
//  LowPriceTableViewCell.m
//  Jump
//
//  Created by mac on 2020/6/15.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "LowPriceTableViewCell.h"
#import "PriceView.h"
#import "Masonry.h"
@interface LowPriceTableViewCell()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UIButton *fullButton;
@property(nonatomic,assign) BOOL onOff;
@property(nonatomic,strong) GameIntroduceModle *gameModel;
@end
@implementation LowPriceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bgview1.layer.cornerRadius = 4.0f;
    self.bgview1.layer.masksToBounds = YES;
    self.chineseButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.chineseButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.bgview2.layer.cornerRadius = 4.0f;
    self.bgview2.layer.masksToBounds = YES;
    
    self.bgview1.layer.cornerRadius = 4.0f;
    self.bgview1.layer.masksToBounds = YES;
}

-(void)cellData:(GameIntroduceModle *)model{
    self.gameModel = model;
    NSString *isChinese = model.data.game.chinese_all == 1?@"中文 ▶\n全区中文":@"中文 ▶\n无";
    [self.chineseButton setAttributedTitle:[self returnTextStr:isChinese model:model range:2] forState:UIControlStateNormal];
    
    NSString *gameSize = model.data.game.size != nil?[NSString stringWithFormat:@"容量\n%@",model.data.game.size]:@"容量\n无";
    [self.sizeLabel setAttributedText:[self returnTextStr:gameSize model:model range:2]];
    
    NSString *players = model.data.game.players ==1&&model.data.game.playersMin == 1?[NSString stringWithFormat:@"玩家人数\n%ld-%ld",(long)model.data.game.playersMin,(long)model.data.game.players]:[NSString stringWithFormat:@"玩家人数\n%ld",(long)model.data.game.playersMin];
    
    [self.players setAttributedText:[self returnTextStr:players model:model range:4]];
    
    
    self.historyPrice.text = [NSString stringWithFormat:@"历史最低:¥%@",model.data.game.lowestPrice];
    
    
    [self priceView:model.data.prices];
    //NSString *gameCard = model.data.game.chinese_all == 1?@"中文 ▶\n全区中文":@"中文 ▶\n无";
    //[self.chineseButton setAttributedTitle:[self returnTextStr:isChinese model:model range:2] forState:UIControlStateNormal];
    
   // NSString *isChinese = model.data.game.chinese_all == 1?@"中文 ▶\n全区中文":@"中文 ▶\n无";
   // [self.chineseButton setAttributedTitle:[self returnTextStr:isChinese model:model range:2] forState:UIControlStateNormal];
    
   // NSString *isChinese = model.data.game.chinese_all == 1?@"中文 ▶\n全区中文":@"中文 ▶\n无";
   // [self.chineseButton setAttributedTitle:[self returnTextStr:isChinese model:model range:2] forState:UIControlStateNormal];
    
}

-(NSMutableAttributedString *)returnTextStr:(NSString *)string model:(GameIntroduceModle *)model range:(NSInteger )strRaing{
    
    NSMutableAttributedString *tempPriceStr = [[NSMutableAttributedString alloc]initWithString:string];
    //NSLog(@"%@",tempPriceStr);
    //1段
    [tempPriceStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, strRaing)];
    [tempPriceStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, strRaing)];
    //[cell.gameTitleLabel setAttributedText:tempPriceStr];
    return tempPriceStr;
}

-(void)priceView:(NSArray *)priceViewArr{
    NSMutableArray *tempArr = [NSMutableArray new];
    if (priceViewArr.count > 3) {
        [tempArr addObject:priceViewArr[0]];
        [tempArr addObject:priceViewArr[1]];
        [tempArr addObject:priceViewArr[3]];
    }else{
        [tempArr addObjectsFromArray:priceViewArr];
    }
    for (int i =0; i< tempArr.count; i++) {
        Prices *price = tempArr[i];
        PriceView *view = [[PriceView alloc]initWithFrame:CGRectMake(0, 60 * i, DeviceWidth - 10, 60)];
        view.countryLabel.text = price.country;
        //view.backgroundColor = [UIColor greenColor];
        
        //富文本价格
        if(price.goldPoint != nil){
             view.goldLabel.text = [NSString stringWithFormat:@"金币+%@",price.goldPoint];
        }else{
            view.goldLabel.hidden = YES;
        }
        if(![[NSString stringWithFormat:@"%ld",(long)price.cutoff] isEqualToString:@"0"]){
            
            [view.cutOff setTitle:[NSString stringWithFormat:@"%ld%%折扣",price.cutoff] forState:UIControlStateNormal];
            NSString *leftDate = [NSString stringWithFormat:@"剩余%@\n%@ 结束",price.leftDiscount,price.discountEnd];
            NSMutableAttributedString *tempLeftStr = [[NSMutableAttributedString alloc]initWithString:leftDate];
            [tempLeftStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:8] range:NSMakeRange(0, price.leftDiscount.length + 2)];
            //[tempDataeStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, price.leftDiscount.length + 2)];
            [view.leftDays setAttributedText:tempLeftStr];
            
        }else{
            view.cutOff.hidden = YES;
            view.leftDays.hidden = YES;
        }
        
        NSString *tempPrice;
        if (![price.country isEqualToString:@"实体卡带"]) {
            tempPrice = [NSString stringWithFormat:@"¥%@\n(%@ %@)",price.price,price.coinName,price.originPrice];
        }else{
            tempPrice = [NSString stringWithFormat:@"¥%@",price.price];
        }

        NSMutableAttributedString *tempPriceStr = [[NSMutableAttributedString alloc]initWithString:tempPrice];
        [tempPriceStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, price.price.length + 1)];
        [tempPriceStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, price.price.length + 1)];
        [view.priceLabel setAttributedText:tempPriceStr];
        
        [self.morePriceButton addTarget:self action:@selector(morePriceButtonClicek:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.bgview2 addSubview:view];
        if (price.payMethod.count != 0) {
            [view payMethod:price.payMethod];
        }
         
        
    }

    
}

-(void)morePriceButtonClicek:(UIButton *)sender{
    
    if (self.fullButton == nil) {
        self.fullButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, DeviceWidth, DeviceHeight)];
        [[UIApplication sharedApplication].keyWindow addSubview:self.fullButton];
        self.fullButton.backgroundColor =[[UIColor grayColor]colorWithAlphaComponent:0.7f];
        [self.fullButton addTarget:self action:@selector(fullButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.onOff = YES;
        [self priceTableView];
    }
    
    [self onOffClick];
}

-(void)fullButtonClick:(UIButton *)sender{
    
    [self onOffClick];
    
}

-(void)onOffClick{
    
    if (self.onOff == YES) {
        self.fullButton.hidden = YES;
        self.onOff = NO;
    }else{
        self.fullButton.hidden = NO;
        self.onOff = YES;
    }
    
}



-(void)priceTableView{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(10, NaviTopBarHeight + 10, DeviceWidth - 20, DeviceHeight - 100 - 10 - NaviTopBarHeight) style:UITableViewStylePlain];
    [self.fullButton addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.layer.cornerRadius = 6.0f;
    tableView.layer.masksToBounds = YES;

    UIButton *hideButton = [[UIButton alloc]initWithFrame:CGRectZero];
    [self.fullButton addSubview:hideButton];
    [hideButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        makeTop(tableView.mas_bottom, 10);
        make.centerX.mas_equalTo(tableView.mas_centerX);
        makeHeight(44);
        makeWidth(44);
    }];
    [hideButton setImage:[UIImage imageNamed:@"icon_back.png"] forState:UIControlStateNormal];
    [hideButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)backButtonClick:(UIButton *)sender{
    
    [self onOffClick];
    
}



-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.gameModel.data.prices.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = [[NSString alloc]initWithFormat:@"%ld",(long)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        Prices *tempPrice = self.gameModel.data.prices[indexPath.row];
        
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,  DeviceWidth - 20, 60)];
        [cell.contentView addSubview:bgView];
        bgView.backgroundColor = [UIColor redColor];
        
        PriceView *tempPriceView = [[PriceView alloc]initWithFrame:bgView.frame];
        [bgView addSubview:tempPriceView];
        tempPriceView.countryLabel.text = tempPrice.country;
        [tempPriceView payMethod:tempPrice.payMethod];
        if(tempPrice.goldPoint != nil){
             tempPriceView.goldLabel.text = [NSString stringWithFormat:@"金币+%@",tempPrice.goldPoint];
        }else{
            tempPriceView.goldLabel.hidden = YES;
        }
        
        if(![[NSString stringWithFormat:@"%ld",(long)tempPrice.cutoff] isEqualToString:@"0"]){
            
            [tempPriceView.cutOff setTitle:[NSString stringWithFormat:@"%ld%%折扣",tempPrice.cutoff] forState:UIControlStateNormal];
            NSString *leftDate = [NSString stringWithFormat:@"剩余%@\n%@ 结束",tempPrice.leftDiscount,tempPrice.discountEnd];
            NSMutableAttributedString *tempLeftStr = [[NSMutableAttributedString alloc]initWithString:leftDate];
            [tempLeftStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:8] range:NSMakeRange(0, tempPrice.leftDiscount.length + 2)];
            //[tempDataeStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, price.leftDiscount.length + 2)];
            [tempPriceView.leftDays setAttributedText:tempLeftStr];
            
        }else{
            tempPriceView.cutOff.hidden = YES;
            tempPriceView.leftDays.hidden = YES;
        }
        
        NSString *tempPrice1;
        if (![tempPrice.country isEqualToString:@"实体卡带"]) {
            tempPrice1 = [NSString stringWithFormat:@"¥%@\n(%@ %@)",tempPrice.price,tempPrice.coinName,tempPrice.originPrice];
        }else{
            tempPrice1 = [NSString stringWithFormat:@"¥%@",tempPrice.price];
        }

        NSMutableAttributedString *tempPriceStr = [[NSMutableAttributedString alloc]initWithString:tempPrice1];
        [tempPriceStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, tempPrice.price.length + 1)];
        [tempPriceStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, tempPrice.price.length + 1)];
        [tempPriceView.priceLabel setAttributedText:tempPriceStr];
        
       // [self.morePriceButton addTarget:self action:@selector(morePriceButtonClicek:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }
    
    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
