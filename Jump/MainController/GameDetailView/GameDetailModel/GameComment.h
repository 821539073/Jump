//
//Created by ESJsonFormatForMac on 20/06/18.
//

#import <Foundation/Foundation.h>

@class CommentListResult,CommentListData,Comment,Content;
@interface GameComment : NSObject

@property (nonatomic, strong) CommentListResult *result;

@property (nonatomic, strong) CommentListData *data;

@end
@interface CommentListResult : NSObject

@property (nonatomic, assign) NSInteger code;

@end

@interface CommentListData : NSObject

@property (nonatomic, strong) NSArray *comment;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger hits;

@end

@interface Comment : NSObject

@property (nonatomic, assign) NSInteger positiveNum;

@property (nonatomic, assign) NSInteger negativeNum;

@property (nonatomic, copy) NSString *commentId;

@property (nonatomic, copy) NSString *version;

@property (nonatomic, copy) NSString *avatarUrl;

@property (nonatomic, assign) NSInteger attitude;

@property (nonatomic, assign) NSInteger happyNum;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray *content;

@end

@interface Content : NSObject

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *text;

@end

