//
//Created by ESJsonFormatForMac on 20/06/20.
//

#import <Foundation/Foundation.h>

@class TodayRecomResult,TodayRecomData,InformationFlow;
@interface TodayRecomModel : NSObject

@property (nonatomic, strong) TodayRecomResult *result;

@property (nonatomic, strong) TodayRecomData *data;

@end
@interface TodayRecomResult : NSObject

@property (nonatomic, assign) NSInteger code;

@end

@interface TodayRecomData : NSObject

@property (nonatomic, strong) NSArray *information_flow;

@property (nonatomic, assign) NSInteger all_size;

@end

@interface InformationFlow : NSObject

@property (nonatomic, copy) NSString *appid;

@property (nonatomic, copy) NSString *gameTitleZh;

@property (nonatomic, copy) NSString *gameId;

@property (nonatomic, copy) NSString *avatarUrl;

@property (nonatomic, copy) NSString *attitude;

@property (nonatomic, assign) NSInteger moduleId;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, assign) float price;

@property (nonatomic, copy) NSString *acceptorId;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *gameTitle;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, copy) NSString *startTime;

@property (nonatomic, copy) NSString *content;

@end

