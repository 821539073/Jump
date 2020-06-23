//
//  GameNameTableViewCell.h
//  Jump
//
//  Created by mac on 2020/6/16.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameNameTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *gameTitleLabel;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UILabel *gameDeatilLabel;
@property (weak, nonatomic) IBOutlet UILabel *recomLabel;
@property (weak, nonatomic) IBOutlet UILabel *scroeLabel;

-(void)gameType:(NSArray *)gameTypeArr Chinese:(NSInteger)chineseAll;

@end

NS_ASSUME_NONNULL_END
