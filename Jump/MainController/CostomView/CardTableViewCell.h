//
//  CardTableViewCell.h
//  Jump
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *gamePic;
@property (weak, nonatomic) IBOutlet UILabel *gameTitle;
@property (weak, nonatomic) IBOutlet UILabel *gameEnTitle;
@property (weak, nonatomic) IBOutlet UILabel *gamePrice;
@property (weak, nonatomic) IBOutlet UILabel *ChineseLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowestPriceLable;
@property (weak, nonatomic) IBOutlet UIImageView *RecommImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *RecommImageView2;
@property (weak, nonatomic) IBOutlet UILabel *GradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *surplusLable;

@end

NS_ASSUME_NONNULL_END
