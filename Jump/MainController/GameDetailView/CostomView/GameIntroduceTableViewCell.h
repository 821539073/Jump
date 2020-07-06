//
//  GameIntroduceTableViewCell.h
//  Jump
//
//  Created by mac on 2020/6/16.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYKit/YYKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol GameIntroduceTableViewCellDelegate <NSObject>

-(void)reloadTableViewCellHeight;

@end


@interface GameIntroduceTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet YYLabel *yyLable;

@property (nonatomic,unsafe_unretained)id<GameIntroduceTableViewCellDelegate>delegate;

-(void)addTextWithText:(NSString *)deatilText;
@end

NS_ASSUME_NONNULL_END
