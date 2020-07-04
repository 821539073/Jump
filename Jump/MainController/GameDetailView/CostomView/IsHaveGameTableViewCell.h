//
//  IsHaveGameTableViewCell.h
//  Jump
//
//  Created by mac on 2020/7/4.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IsHaveGameTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *topTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *centerLable;
@property (weak, nonatomic) IBOutlet UIButton *ownButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIButton *unCommentButton;
@property (weak, nonatomic) IBOutlet UIView *bottomBGview;

@end

NS_ASSUME_NONNULL_END
