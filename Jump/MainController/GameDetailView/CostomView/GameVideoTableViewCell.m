//
//  GameVideoTableViewCell.m
//  Jump
//
//  Created by mac on 2020/6/15.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "GameVideoTableViewCell.h"
#import <SDWebImage/UIButton+WebCache.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface GameVideoTableViewCell()

@property(nonatomic,strong)NSArray *images;
@property(nonatomic,strong)NSArray *videos;
@property(nonatomic,strong)UIButton *LastButton;
@end

@implementation GameVideoTableViewCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.showImageView.contentMode = UIViewContentModeScaleToFill;
    self.sliderScrollView = [[UIScrollView alloc]init];
    [self.contentView addSubview:self.sliderScrollView];
    self.sliderScrollView.backgroundColor = [UIColor grayColor];
    self.sliderScrollView.showsHorizontalScrollIndicator = NO;
    [self.sliderScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        makeTop(self.showImageView.mas_bottom, 0);
        makeLeft(self.contentView.mas_left, 0);
        makeRight(self.contentView.mas_right, 0);
        makeHeight(60);
    }];
    self.videoplayButton.hidden = YES;
    
}

-(void)ScrollViewImages:(NSArray *)imageArr Video:(nonnull NSArray *)videoArr{
    NSInteger sliderViewCount = 0;
    if (imageArr.count != 0) {
        sliderViewCount = imageArr.count;
        if (videoArr.count != 0) {
            sliderViewCount = imageArr.count + videoArr.count;
        }
    }
    
    self.sliderScrollView.contentSize = CGSizeMake((2 +60 *1.4) * sliderViewCount, 60);
    
    for (int i = 0; i < sliderViewCount; i++) {
    UIButton *button = [[UIButton alloc]init];
    [self.sliderScrollView addSubview:button];
    button.frame = CGRectMake(0 + (60 * 1.4 + 2) *i, 0, 60 * 1.4, 60);
    button.backgroundColor = [UIColor blueColor];
    button.tag = 1000 + i;
        
    if (i < videoArr.count) {
        NSString *tempVideoPic = videoArr[i];
        NSArray *tempArr = [videoArr[i] componentsSeparatedByString:@","];
        for (NSString *tempStr in tempArr) {
            if ([tempStr containsString:@"jpg"] ) {
                tempVideoPic = tempStr;
            }
            if (i == 0) {
                [self.showImageView sd_setImageWithURL:[NSURL URLWithString:tempVideoPic]];
                button.layer.borderWidth = 2;
                button.layer.borderColor = [UIColor whiteColor].CGColor;
                button.layer.masksToBounds = YES;
                self.LastButton = button;
                self.videoplayButton.hidden = NO;
                UIButton *playButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
                [button addSubview:playButton];
                [playButton setImage:[UIImage imageNamed:@"icon_videoplay.png"] forState:UIControlStateNormal];
                playButton.center = CGPointMake(button.center.x, button.center.y);
                [playButton addTarget:self action:@selector(playButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            }
        }
        [button sd_setImageWithURL:[NSURL URLWithString:tempVideoPic] forState:UIControlStateNormal];
    }else{
        if (videoArr.count == 0) {
            [self.showImageView sd_setImageWithURL:[NSURL URLWithString:imageArr[0]]];
        }
        
        [button sd_setImageWithURL:[NSURL URLWithString:imageArr[i - videoArr.count]] forState:UIControlStateNormal];
    }
        
        [button addTarget:self action:@selector(siderViewButton:) forControlEvents:UIControlEventTouchUpInside];
    
 }
    self.videos = videoArr;
    self.images = imageArr;
}

-(void)siderViewButton:(UIButton *)sender{
    if (self.videos.count != 0) {
            if (sender.tag - 1000 < self.videos.count) {
                NSString *tempVideoPic = self.videos[sender.tag - 1000];
                NSArray *tempArr = [self.videos[sender.tag - 1000] componentsSeparatedByString:@","];
                for (NSString *tempStr in tempArr) {
                    if ([tempStr containsString:@"jpg"] ) {
                        tempVideoPic = tempStr;
                    }
                }
                [self.showImageView sd_setImageWithURL:[NSURL URLWithString:tempVideoPic]];
                self.videoplayButton.hidden = NO;
            }else{
                self.videoplayButton.hidden = YES;
                [self.showImageView sd_setImageWithURL:[NSURL URLWithString:self.images[sender.tag - 1000 - self.videos.count]]];
            }
    }else{
        [self.showImageView sd_setImageWithURL:[NSURL URLWithString:self.images[sender.tag - 1000]]];
    }
    
    
    
    if (self.LastButton == sender) {
    
    }else{
        sender.layer.borderWidth = 2;
        sender.layer.borderColor = [UIColor whiteColor].CGColor;
        sender.layer.masksToBounds = YES;
        
        self.LastButton.layer.borderWidth = 0;
        self.LastButton.layer.masksToBounds = YES;
    }
    self.LastButton = sender;


}

-(void)playButtonClick:(UIButton *)sender{
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
