//
//  LowPriceTableViewCell.h
//  Jump
//
//  Created by mac on 2020/6/15.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameIntroduceModle.h"
NS_ASSUME_NONNULL_BEGIN

@interface LowPriceTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bgview1;
@property (weak, nonatomic) IBOutlet UIButton *chineseButton;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *players;
@property (weak, nonatomic) IBOutlet UILabel *gameCard;
@property (weak, nonatomic) IBOutlet UILabel *gameDemo;
@property (weak, nonatomic) IBOutlet UILabel *historyPrice;
@property (weak, nonatomic) IBOutlet UIButton *questionButton;
@property (weak, nonatomic) IBOutlet UIButton *reportDataError;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIView *bgview2;
@property (weak, nonatomic) IBOutlet UIButton *morePriceButton;

-(void)cellData:(GameIntroduceModle *)model;

@end

NS_ASSUME_NONNULL_END
