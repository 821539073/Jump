//
//  EvaluatTableViewCell.h
//  Jump
//
//  Created by mac on 2020/7/7.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "GameComment.h"
#import <YYKit/YYKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol EvaluatTableViewCellDelegate <NSObject>

-(void)reloadTableViewCellHeight;

@end


@interface EvaluatTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameAndTimeLabel;
@property (strong, nonatomic) IBOutlet UIView *contentTextBgView;
@property (strong, nonatomic) IBOutlet UIButton *shareButton;
@property (strong, nonatomic) IBOutlet UIButton *replayButton;
@property (strong, nonatomic) IBOutlet UIButton *funButton;
@property (strong, nonatomic) IBOutlet UIButton *userFulButton;
@property (strong, nonatomic) IBOutlet UIButton *unuseButton;

@property (strong, nonatomic) UIButton *commendButton;
@property (strong, nonatomic) UIButton *moreButton;
@property (strong, nonatomic) YYLabel *yylabel;

-(void)commendAndMoreButtonCellStyle1:(Comment *)comment;
-(void)commendAndMoreButtonCellStyle2:(Comment *)comment;

@end

NS_ASSUME_NONNULL_END
