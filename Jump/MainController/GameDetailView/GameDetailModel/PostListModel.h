//
//Created by ESJsonFormatForMac on 20/07/18.
//

#import <Foundation/Foundation.h>

@class PostListResult,PostListData,PostListList,PostListContent;
@interface PostListModel : NSObject

@property (nonatomic, strong) PostListResult *result;

@property (nonatomic, strong) PostListData *data;

@end
@interface PostListResult : NSObject

@property (nonatomic, assign) NSInteger code;

@end

@interface PostListData : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger hits;

@property (nonatomic, strong) NSArray *list;

@end

@interface PostListList : NSObject

@property (nonatomic, copy) NSString *createTimeImprove;

@property (nonatomic, assign) NSInteger negativeNum;

@property (nonatomic, assign) NSInteger positiveNum;

@property (nonatomic, assign) NSInteger version;

@property (nonatomic, assign) NSInteger voteScoreStr;

@property (nonatomic, assign) NSInteger voteScore;

@property (nonatomic, assign) NSInteger postCommentCount;

@property (nonatomic, copy) NSString *avatarUrl;

@property (nonatomic, copy) NSString *lastReplyTime;

@property (nonatomic, copy) NSString *lastReplyTimeImprove;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *postId;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, strong) NSArray *content;

@end

@interface PostListContent : NSObject

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *text;

@end

