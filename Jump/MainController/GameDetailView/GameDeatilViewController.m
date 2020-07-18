//
//  GameDeatilViewController.m
//  Jump
//
//  Created by mac on 2020/6/15.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "GameDeatilViewController.h"
#import "horizontalSlideButtonView.h"
#import "Masonry.h"
#import "NetWorkObject.h"
#import "GameVideoTableViewCell.h"
#import "GameNameTableViewCell.h"
#import "LowPriceTableViewCell.h"
#import "GameIntroduceModle.h"
//#import "YYModel.h"
#import "GameComment.h"
#import "GameDiscountTableViewCell.h"
#import "GameDisCountModel.h"
#import "GradeTableViewCell.h"
#import <YYKit/YYKit.h>
#import "GameIntroduceTableViewCell.h"
#import "IsHaveGameTableViewCell.h"
#import "EvaluatTableViewCell.h"
#import "PostListModel.h"
#import "squareEntryListModel.h"

@interface GameDeatilViewController ()<UITableViewDelegate,UITableViewDataSource,GameIntroduceTableViewCellDelegate>
@property(nonatomic,strong) UITableView *gameDetailTableView;
@property(nonatomic,strong) horizontalSlideButtonView *horizonTalButton;

@property(nonatomic,strong) GameIntroduceModle *dataModel;
@property(nonatomic,strong) GameComment *GameCommentModel;
@property(nonatomic,strong) GameDisCountModel*gameDiscountModel;
@property(nonatomic,strong) PostListModel *postList;
@property(nonatomic,strong) squareEntryListModel *squareEntryList;
@property(nonatomic,assign) BOOL discounrowOnOff;
@property(nonatomic,assign) BOOL LabelOpen;

@property(nonatomic,assign) float deatilRowHeight;
@end

@implementation GameDeatilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.LabelOpen = YES;
    self.horizonTalButton = [[horizontalSlideButtonView alloc]init];
     [self.view addSubview:self.horizonTalButton];
     [self.horizonTalButton mas_makeConstraints:^(MASConstraintMaker *make) {
         makeLeft(self.view.mas_left, 0);
         makeRight(self.view.mas_right, 0);
         makeTop(self.view.mas_top, 0);
         makeHeight(44);
     }];
    
    [self.horizonTalButton numOfButtonWithArr:@[@"游戏",@"评测",@"圈子",@"讨论"] horizontalSlideButtonType:HorizontalSlideButtonType4];
    
    // Do any additional setup after loading the view.
    
    
    UIView *bottomView = [[UIView alloc]init];
    [self.view addSubview:bottomView];
    bottomView.backgroundColor = [UIColor redColor];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        makeHeight(50);
        makeBottom( self.view.mas_bottom,50);
        makeLeft(self.view.mas_left, 0);
        makeRight(self.view.mas_right, 0);
    }];
    
   
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 30, 30);
    [button setBackgroundImage:[UIImage imageNamed:@"icon_navBack.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showLeft:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = barButton;
    
    [self gameDetailView];
    [self GameFetchInfo];
    [self FetchListGameComment];


    
}
-(void)GameFetchInfo{
    [NetWorkObject GameDetialCode:self.appid Success:^(id  _Nonnull success) {
        self.dataModel = [GameIntroduceModle modelWithDictionary:success];
        [self.gameDetailTableView reloadData];
    } failure:^(id  _Nonnull failure) {
        NSLog(@"%@",failure);
    }];
}
-(void)FetchListGameComment{
    
    [NetWorkObject ListGameComment:self.appid Success:^(id  _Nonnull success) {
        self.GameCommentModel = [GameComment modelWithJSON:success];
        [self FetchgetDiscount];
        [self.gameDetailTableView reloadData];
    } failure:^(id  _Nonnull failure) {
        NSLog(@"%@",failure);
    }];
    
}

-(void)FetchgetDiscount{
    
    [NetWorkObject getPostListEntityIdStr:self.appid Success:^(id  _Nonnull success) {
        self.postList = [PostListModel modelWithJSON:success];
        [self getsquareEntryList];
        [self.gameDetailTableView reloadData];
    } failure:^(id  _Nonnull failure) {
        
    }];
    
}

-(void)getsquareEntryList{
    
    [NetWorkObject getsquareEntryListGameIdStr:self.appid Success:^(id  _Nonnull success) {
        self.squareEntryList = [squareEntryListModel modelWithJSON:success];
        [self topSliderView];
        [self.gameDetailTableView reloadData];
    } failure:^(id  _Nonnull failure) {
        
    }];
}


-(void)topSliderView{
    NSString *count;
    NSString *hits;
    NSString *squareEntryList;
    if (self.GameCommentModel.data.count > 1000) {
        count = [NSString stringWithFormat:@"评测/%.1fk",[[NSNumber numberWithLong:self.GameCommentModel.data.count] floatValue]/1000];
    }else{
        count = [NSString stringWithFormat:@"评测/%ld",(long)self.GameCommentModel.data.count];
    }
    if (self.postList.data.count > 1000) {
        hits = [NSString stringWithFormat:@"讨论/%.1fk",[[NSNumber numberWithLong:self.postList.data.count] floatValue]/1000];
    }else{
        hits = [NSString stringWithFormat:@"讨论/%ld",(long)self.postList.data.count];
    }
    
    squareEntryList = [NSString stringWithFormat:@"圈子/%ld",self.squareEntryList.data.totalCount];
     
    [self.horizonTalButton numOfButtonWithArr:@[@"游戏",count,squareEntryList,hits] horizontalSlideButtonType:HorizontalSlideButtonType4];
    
}


-(void)showLeft:(UIButton *)button{
    
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)gameDetailView{
    
    self.gameDetailTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.gameDetailTableView];
    [self.gameDetailTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        makeEdges(self.view, 44, 0, 0, 0);
    }];
    self.gameDetailTableView.delegate = self;
    self.gameDetailTableView.dataSource = self;
    self.gameDetailTableView.backgroundColor = [UIColor grayColor];
    self.discounrowOnOff = NO;
}




-(void)gameEvaluatView{
    
    
}


-(void)gameDiscussView{
    
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0&&indexPath.row == 0) {
        return 200;
    }else if(indexPath.section == 0&&indexPath.row == 1){
        if (self.dataModel != nil) {
                    NSString *tempstr =[NSString stringWithFormat:@"%@ %@\n\n%@/%@",self.dataModel.data.game.titleZh,self.dataModel.data.game.title,self.dataModel.data.game.pubDate,self.dataModel.data.game.publisher];
            NSMutableAttributedString *tempPriceStr = [[NSMutableAttributedString alloc]initWithString:tempstr];
            //NSLog(@"%@",tempPriceStr);
            //1段
            [tempPriceStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, self.dataModel.data.game.titleZh.length + self.dataModel.data.game.title.length + 1)];
            [tempPriceStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, self.dataModel.data.game.titleZh.length + self.dataModel.data.game.title.length + 1)];
            NSMutableAttributedString *tempIntroducestr = self.dataModel.data.game.brief == nil?[[NSMutableAttributedString alloc]initWithString:@""]:[[NSMutableAttributedString alloc]initWithString:self.dataModel.data.game.brief];
            if ([self cellHeight:tempPriceStr] + [self cellHeight:tempIntroducestr] + 45 <=116) {
                return 116;
            }else{
                return [self cellHeight:tempPriceStr] + [self cellHeight:tempIntroducestr] + 45;
            }
            
            
        }else{
            return 117;;
        }

    }else if(indexPath.section == 0&&indexPath.row == 2){
        if (self.dataModel != nil) {
            if (self.dataModel.data.prices.count > 3) {
                return 310;
            }else{
                return 150 + 30 * self.dataModel.data.prices.count;
            }
        }else{
            
            return 180;
        }

        
    }else if(indexPath.section == 0&&indexPath.row == 3){
        if (self.discounrowOnOff == YES) {
            if (self.gameDiscountModel != nil) {
                return 200;
            }else{
                return 44;
            }
        }else{
            return 44;
        }

    }else if(indexPath.section == 0&&indexPath.row == 4){
        if (self.dataModel.data.game.rate == 0) {
            return 0;
        }
        return 90;

    }else if(indexPath.section == 0&&indexPath.row == 5){
        
        if (self.dataModel.data.game.detail.length == 0) {
            return 0;
        }
        [self deatilRowHeightWithString:@""];
        if (self.LabelOpen == NO) {
            //[self deatilRowHeightWithString:@""];
            return self.deatilRowHeight + 45;
        }if (self.LabelOpen == YES) {
            if (self.deatilRowHeight + 45 < 162) {
                return self.deatilRowHeight + 45;
            }else{
                return 162;
            }
        }

    }else if(indexPath.section == 0&&indexPath.row == 6){
        
        return 150 ;

    }else if(indexPath.section == 1){
        Comment *tempcomment = self.GameCommentModel.data.comment[indexPath.row];
        CGFloat height = 0.0;
        for (Content *tempcontent in tempcomment.content) {
            if ([tempcontent.type isEqualToString:@"text"]) {
                UILabel *label = [[UILabel alloc]init];
                label.numberOfLines = 0;
                label.textAlignment = NSTextAlignmentLeft;
                label.text = tempcontent.text;
                label.font = [UIFont systemFontOfSize:16];
                CGSize labelSize = [label sizeThatFits:CGSizeMake(DeviceWidth - 100, MAXFLOAT)];
                height = ceil(labelSize.height) + 1;
            }else if ([tempcontent.type isEqualToString:@"image"]){
                height  = height + 88;
            }
        }
        if(height < 44 ) {
            return 44 + 98;
        }else if(height > 202){
            return 202 + 98;
        }else{
            return height + 98;
        }
        //return 300;
    }else{
        return 44;
    }
    
     return 44;
}
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGFLOAT_MIN;
    }else{
        return 44;
    }
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor grayColor];
    UILabel *titleLable = [[UILabel alloc]init];
    [bgView addSubview:titleLable];
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        makeLeft(bgView.mas_left, 15);
        make.centerY.mas_equalTo(bgView.mas_centerY);
    }];
    titleLable.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    titleLable.backgroundColor = [UIColor redColor];
    
    UILabel *evaluatNum = [[UILabel alloc]init];
    [bgView addSubview:evaluatNum];
    evaluatNum.font = [UIFont systemFontOfSize:10];
    [evaluatNum mas_makeConstraints:^(MASConstraintMaker *make) {
        makeLeft(titleLable.mas_right, 5);
        makeTop(bgView.mas_top, 10);
    }];
    
    UIImageView *rightImageView = [[UIImageView alloc]init];
    [bgView addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        makeWidth(20);
        makeHeight(20);
        makeRight(bgView.mas_right, -10);
        make.centerY.mas_equalTo(bgView.mas_centerY);
    }];
    rightImageView.backgroundColor = [UIColor redColor];
    rightImageView.image = [UIImage imageNamed:@"icon_right.png"];
    
    UILabel *detailLabel = [[UILabel alloc]init];
    [bgView addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        makeRight(rightImageView.mas_left, -5);
        make.centerY.mas_equalTo(bgView.mas_centerY);
    }];
    detailLabel.text = @"查看全部评测";
    detailLabel.textColor = RGB(191, 191, 191);
    detailLabel.font = [UIFont systemFontOfSize:12];
    
    
    if (section == 1) {
        evaluatNum.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.GameCommentModel.data.comment.count];
        titleLable.text = @"社区讨论";
        return bgView;
    }else{
        return NULL;
    }
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 7;
    }else if(section == 1){
        return self.GameCommentModel.data.comment.count;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    if (indexPath.section == 0&&indexPath.row == 0) {
        static NSString *cellId = @"cellID0";
        GameVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"GameVideoTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //tableView.separatorStyle =NO;
            [cell ScrollViewImages:self.dataModel.data.game.pics Video:self.dataModel.data.game.videos];
            
        }
        return cell;
    }else if(indexPath.section == 0&&indexPath.row == 1){
        static NSString *cellId = @"cellID1";
         GameNameTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellId];
         if (!cell) {
             NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"GameNameTableViewCell" owner:self options:nil];
             cell = [nib objectAtIndex:0];
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
             //tableView.separatorStyle =NO;
             NSString *tempstr =[NSString stringWithFormat:@"%@ %@\n%@/%@",self.dataModel.data.game.titleZh,self.dataModel.data.game.title,self.dataModel.data.game.pubDate,self.dataModel.data.game.publisher];
              
             NSMutableAttributedString *tempPriceStr = [[NSMutableAttributedString alloc]initWithString:tempstr];
             //NSLog(@"%@",tempPriceStr);
             //1段
             [tempPriceStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, self.dataModel.data.game.titleZh.length + self.dataModel.data.game.title.length + 1)];
             [tempPriceStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, self.dataModel.data.game.titleZh.length + self.dataModel.data.game.title.length + 1)];
 
             [cell.gameTitleLabel setAttributedText:tempPriceStr];
             cell.gameDeatilLabel.text = self.dataModel.data.game.brief;
             
             
             NSString *recommStr =[NSString stringWithFormat:@"JUMP评分\n%@",self.dataModel.data.game.recommendLabel];
               
              NSMutableAttributedString *temprecommStr = [[NSMutableAttributedString alloc]initWithString:recommStr];
              //NSLog(@"%@",tempPriceStr);
              //1段
              [temprecommStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:6] range:NSMakeRange(0, 6)];
             [cell.recomLabel  setAttributedText:temprecommStr];
             cell.scroeLabel.text = [NSString stringWithFormat:@"推荐率%ld%%\n%ld人评测",(long)self.dataModel.data.game.recommendRate,(long)self.dataModel.data.game.commentNum];
             [cell gameType:self.dataModel.data.game.category Chinese:self.dataModel.data.game.chinese_all];
             
             
         }
         return cell;
    }else if(indexPath.section == 0&&indexPath.row == 2){
        static NSString *cellId = @"cellID2";
         LowPriceTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellId];
         if (!cell) {
             NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"LowPriceTableViewCell" owner:self options:nil];
             cell = [nib objectAtIndex:0];
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
             //tableView.separatorStyle =NO;
             if (self.dataModel != nil) {
                 [cell cellData:self.dataModel];
             }
         }
         return cell;
    }else if(indexPath.section == 0&&indexPath.row == 3){
        static NSString *cellId = @"cellID3";
        GameDiscountTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"GameDiscountTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell ChartViewData:self.gameDiscountModel];
            
        }
        return cell;
    }else if(indexPath.section == 0&&indexPath.row == 4){
        static NSString *cellId = @"cellID4";
        GradeTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"GradeTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //[cell ChartViewData:self.gameDiscountModel];
            NSMutableAttributedString *tempPriceStr = [[NSMutableAttributedString alloc]initWithString:@"metacritic\n媒体综合评分"];
            [tempPriceStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, 10)];
            [tempPriceStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 10)];
            [cell.GradeLabel setAttributedText:tempPriceStr];
            cell.scoreLable.text = [NSString stringWithFormat:@"%ld", (long)self.dataModel.data.game.rate];
            
        }
        return cell;
    }else if (indexPath.section == 0&&indexPath.row == 5) {
        static NSString *cellId = @"cellID5";
        GameIntroduceTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"GameIntroduceTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.delegate = self;
            if (self.dataModel.data.game.detail.length != 0) {
                [cell addTextWithText:self.dataModel.data.game.detail];
            }
        }
        return cell;
    }else if(indexPath.section == 0&&indexPath.row == 6){
        static NSString *cellId = @"cellID6";
        IsHaveGameTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"IsHaveGameTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell cellStyle1];
        }
        return cell;
    }else if (indexPath.section == 1) {
        static NSString *cellId = @"EvaluatTableViewCell";
        EvaluatTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"EvaluatTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell commendAndMoreButtonCellStyle1:self.GameCommentModel.data.comment[indexPath.row]];
        }
        return cell;
        
        
    }else{
        
        static NSString *cellId = @"cellID";
        UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell1) {
            cell1= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            cell1.selectionStyle = UITableViewCellSelectionStyleNone;
            tableView.separatorStyle = NO;
            }
        return cell1;
    }

}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0&& indexPath.row == 3) {
        if (self.discounrowOnOff == NO) {
            self.discounrowOnOff = YES;
            if (self.gameDiscountModel == nil) {
                    [NetWorkObject GameDiscount:self.appid Success:^(id  _Nonnull success) {
                    self.gameDiscountModel = [GameDisCountModel modelWithJSON:success];
                        [self.gameDetailTableView reloadData];
                } failure:^(id  _Nonnull failure) {
                    
                }];
            }
        }else{
            self.discounrowOnOff = NO;
        }
        [self.gameDetailTableView reloadData];
    }else if (indexPath.section == 1){
        
        
        
    }
    
}

-(float)cellHeight:(NSMutableAttributedString *)test{
    
    UITextView *textView = [[UITextView alloc]init];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
       paragraphStyle.lineSpacing = 4;
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:14], NSParagraphStyleAttributeName:paragraphStyle};
    textView.attributedText = [[NSAttributedString alloc]initWithString:textView.text attributes:attributes];
       //获取设置文本间距以后的高度
       CGRect fram = [test boundingRectWithSize:CGSizeMake(225, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return fram.size.height;
}

-(void)reloadTableViewCellHeight{

    self.LabelOpen = NO?YES:NO;
    [self.gameDetailTableView reloadData];
    
}

-(void)deatilRowHeightWithString:(NSString *)deatil{

    UILabel *label = [[UILabel alloc]init];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentLeft;
    label.text = self.dataModel.data.game.detail;
    label.font = [UIFont systemFontOfSize:16];
    CGSize labelSize = [label sizeThatFits:CGSizeMake(DeviceWidth - 10, MAXFLOAT)];
    CGFloat height = ceil(labelSize.height) + 1;
    self.deatilRowHeight = height;
}

//一起滑动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 44;
    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }else if(scrollView.contentOffset.y >= sectionHeaderHeight){
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

/*E
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
