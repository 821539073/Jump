//
//  RecommdViewController.m
//  Jump
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "RecommdViewController.h"
#import "horizontalSlideButtonView.h"
#import "SDCycleScrollView.h"
#import "MainCardView.h"
#import "Masonry.h"
#import "MainCardView.h"
#import "LoginViewController.h"
#import "NetWorkObject.h"
#import "ChartView.h"
#import "TodayRecommendView.h"
#import "GamewalkthroughView.h"

@interface RecommdViewController ()<HorizontalSlideButtonDelegate>
@property(nonatomic,strong)horizontalSlideButtonView *topScroller;
@property(nonatomic,strong)MainCardView *cardView;
@end

@implementation RecommdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    
    [self BarButtonItem];
    [self drawView];

}
-(void)viewWillAppear:(BOOL)animated{
    
    
}

-(void)BarButtonItem{
    UILabel *leftlable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 64)];
    //leftlable.backgroundColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftlable];
    leftlable.text = @"JUMP";
    leftlable.textColor = [UIColor blackColor];
    [leftlable setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:22
                        ]];


    
    
    UISearchBar * searchbar = [[UISearchBar alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 150.0f, 44.0f)];
    //searchbar.delegate = self;

    [searchbar setTintColor:[UIColor redColor]];

    [searchbar setPlaceholder:@"搜索游记、旅行地与用户"];
    UIView * searchBar = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 150.0f, 44.0f)];
    [searchBar addSubview:searchbar];

    self.navigationItem.titleView = searchBar;
    
    
    UIButton *remindButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 16, 16)];
    [remindButton setImage:[UIImage imageNamed:@"icon_alert.png"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:remindButton];
    
    
}

-(void)drawView{
    
    NSArray * topHorizonButtonArr = @[@"最新折扣 ▼",@"今日推荐",@"游戏攻略"];
    self.topScroller = [[horizontalSlideButtonView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.topScroller ];
    self.topScroller.delegate = self;
       //topScroller.backgroundColor = [UIColor blueColor];
    
    [self.topScroller  mas_remakeConstraints:^(MASConstraintMaker *make) {
        makeTop(self.view.mas_top, 0);
        makeLeft(self.view.mas_left, 5);
        makeRight(self.view.mas_right, 5);
        makeHeight(44);
    }];
    [self.topScroller  numOfButtonWithArr:topHorizonButtonArr horizontalSlideButtonType:HorizontalSlideButtonType1];
    //
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44 - 49 - 22 - 44)];
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 3, self.view.frame.size.height - 44 - 49 - 22);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = NO;

    self.cardView = [[MainCardView alloc]initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [self.scrollView addSubview:self.cardView];
    [self.cardView drawVieWithType:MainCardViewType1];
    self.cardView.controller = self;
    
    TodayRecommendView *todayView = [[TodayRecommendView alloc]initWithFrame:CGRectMake(self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [self.scrollView addSubview:todayView];
    
    GamewalkthroughView *walkthroughView = [[GamewalkthroughView alloc]initWithFrame:CGRectMake(self.scrollView.frame.size.width * 2, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    walkthroughView.controller = self;
    [self.scrollView addSubview:walkthroughView];
    
    
    
    //LoginViewController *loginView =[[LoginViewController alloc]init];
    //loginView.modalPresentationStyle = UIModalPresentationFullScreen;
    //loginView.controller = self.navigationController;
    //[self.navigationController presentViewController:loginView animated:YES completion:nil];
}
-(void)siderViewButtonClick:(NSInteger)buttonIndex HorizontalSlideButtonView:(id)viwe{
    if (buttonIndex == 0) {
        self.scrollView.contentOffset = CGPointMake(0, 0);
        [self.cardView FullScreenDiscountTypeView];
    }else if(buttonIndex == 1){
        self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
    }else{
        self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width * 2, 0);
    }
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
