//
//Created by ESJsonFormatForMac on 20/07/18.
//

#import <Foundation/Foundation.h>

@class squareEntryListData,squareEntryListList;
@interface squareEntryListModel : NSObject

@property (nonatomic, assign) BOOL success;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) squareEntryListData *data;

@end
@interface squareEntryListData : NSObject

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, strong) NSArray *list;

@end

@interface squareEntryListList : NSObject

@property (nonatomic, copy) NSString *voteScoreStr;

@property (nonatomic, copy) NSString *modifyTime;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, copy) NSString *top;

@property (nonatomic, copy) NSString *topicName;

@property (nonatomic, assign) float score;

@property (nonatomic, copy) NSString *topicId;

@property (nonatomic, strong) NSArray *picList;

@property (nonatomic, copy) NSString *avatarUrl;

@property (nonatomic, copy) NSString *createTimeStr;

@property (nonatomic, assign) NSInteger gameId;

@property (nonatomic, assign) NSInteger postCommentCount;

@property (nonatomic, assign) NSInteger negativeNum;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *contentStr;

@property (nonatomic, copy) NSString *gameIdStr;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger positiveNum;

@property (nonatomic, copy) NSString *selfAttitude;

@property (nonatomic, assign) NSInteger voteScore;

@property (nonatomic, copy) NSString *squareIdStr;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, assign) NSInteger moduleId;

@property (nonatomic, copy) NSString *content;

@end

