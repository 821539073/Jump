//
//Created by ESJsonFormatForMac on 20/06/16.
//

#import <Foundation/Foundation.h>

@class IntroduceResult,IntroduceData,IntroduceGame,Gamemapbean,Languageregion,Prices;
@interface GameIntroduceModle : NSObject

@property (nonatomic, strong) IntroduceResult *result;

@property (nonatomic, strong) IntroduceData *data;

@end
@interface IntroduceResult : NSObject

@property (nonatomic, assign) NSInteger code;

@end

@interface IntroduceData : NSObject

@property (nonatomic, copy) NSString *usButtomButtonPath;

@property (nonatomic, copy) NSString *jpButtomButtonPath;

@property (nonatomic, copy) NSString *how2buy;

@property (nonatomic, strong) IntroduceGame *game;

@property (nonatomic, strong) NSArray *prices;

@end

@interface IntroduceGame : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, strong) NSArray *languageRegion;

@property (nonatomic, copy) NSString *pubDateMonthDay;

@property (nonatomic, strong) NSArray *category;

@property (nonatomic, copy) NSString *country;

@property (nonatomic, assign) long long discountEnd;

@property (nonatomic, copy) NSString *titleZh;

@property (nonatomic, copy) NSString *pubDate;

@property (nonatomic, assign) NSInteger players;

@property (nonatomic, copy) NSString *detail;

@property (nonatomic, strong) NSArray *pics;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, assign) BOOL pubAlready;

@property (nonatomic, assign) NSInteger nso;

@property (nonatomic, copy) NSString *publisherForSearch;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger demo;

@property (nonatomic, assign) float priceRaw;

@property (nonatomic, copy) NSString *leftDiscount;

@property (nonatomic, assign) BOOL showLineMap;

@property (nonatomic, assign) float price;

@property (nonatomic, assign) NSInteger cutoff;

@property (nonatomic, copy) NSString *lowestPrice;

@property (nonatomic, copy) NSString *originPrice;

@property (nonatomic, strong) NSArray *videos;

@property (nonatomic, copy) NSString *appid;

@property (nonatomic, assign) NSInteger playersMin;

@property (nonatomic, copy) NSString *size;

@property (nonatomic, strong) Gamemapbean *gameMapBean;

@property (nonatomic, copy) NSString *publisher;

@property (nonatomic, copy) NSString *gameStatus;

@property (nonatomic, assign) NSInteger chineseVer;
@property (nonatomic,assign) NSInteger chinese_all;
@property (nonatomic, copy) NSString *title;
@property (nonatomic,assign) NSInteger commentNum;
@property (nonatomic, copy) NSString *brief;
@property (nonatomic, copy) NSString *recommendLabel;
@property (nonatomic, assign) NSInteger recommendLevel;
@property (nonatomic, assign) NSInteger recommendRate;
@property (nonatomic, assign) NSInteger rate;

@property (nonatomic, copy) NSString *coinName;

@property (nonatomic, strong) NSArray *playMode;

@end

@interface Gamemapbean : NSObject

@property (nonatomic, assign) NSInteger steamGameId;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, assign) NSInteger ps4GameId;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, assign) NSInteger switchGameId;

@end

@interface Languageregion : NSObject

@property (nonatomic, copy) NSString *country;

@property (nonatomic, assign) NSInteger english;

@end

@interface Prices : NSObject

@property (nonatomic, assign) NSInteger cutoff;

@property (nonatomic, copy) NSString *coinName;

@property (nonatomic, copy) NSString *country;

@property (nonatomic, copy) NSString *goldPoint;

@property (nonatomic, copy) NSString *discountEnd;

@property (nonatomic, strong) NSArray *payMethod;

@property (nonatomic, copy) NSString *leftDiscount;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *originPrice;

@end

