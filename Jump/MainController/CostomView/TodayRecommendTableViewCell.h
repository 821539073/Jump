//
//  TodayRecommendTableViewCell.h
//  Jump
//
//  Created by mac on 2020/6/20.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TodayRecommendTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *gamePic;
@property (weak, nonatomic) IBOutlet UILabel *gameTitle;
@property (weak, nonatomic) IBOutlet UILabel *recommendTitle;
@property (weak, nonatomic) IBOutlet UIImageView *userProfilePic;
@property (weak, nonatomic) IBOutlet UILabel *usename;
@property (weak, nonatomic) IBOutlet UIButton *checkRecommendButton;

@end

NS_ASSUME_NONNULL_END
