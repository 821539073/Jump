//
//Created by ESJsonFormatForMac on 20/06/27.
//

#import <Foundation/Foundation.h>

@class NormalArticleResult,NormalArticleData,Contentlist;
@interface NormalArticleModel : NSObject

@property (nonatomic, strong) NormalArticleResult *result;

@property (nonatomic, strong) NormalArticleData *data;

@end
@interface NormalArticleResult : NSObject

@property (nonatomic, assign) NSInteger code;

@end

@interface NormalArticleData : NSObject

@property (nonatomic, strong) NSArray *contentList;

@property (nonatomic, copy) NSString *name;

@end

@interface Contentlist : NSObject

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *image;

@end

