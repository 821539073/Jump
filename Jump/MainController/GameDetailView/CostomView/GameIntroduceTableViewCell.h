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

@interface GameIntroduceTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet YYLabel *yyLable;

-(void)addTextWithText:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
