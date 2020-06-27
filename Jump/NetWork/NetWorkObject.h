//
//  NetWorkObject.h
//  Jump
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
NS_ASSUME_NONNULL_BEGIN

@interface NetWorkObject : NSObject
+ (AFSecurityPolicy*)customSecurityPolicy;
+(void)bannerListSuccess:(void(^)(id success))success failure:(void(^)(id failure))failure;
+(void)GameWithSearchType:(NSDictionary *)TypeDic Success:(void(^)(id success))success failure:(void(^)(id failure))failure;
+(void)GameDetialCode:(NSString *)code Success:(void(^)(id success))success failure:(void(^)(id failure))failure;
+(void)ListGameComment:(NSString *)gameCode Success:(void(^)(id success))success failure:(void(^)(id failure))failure;
+(void)GameDiscount:(NSString *)gameCode Success:(void(^)(id success))success failure:(void(^)(id failure))failure;

+(void)TodayGameRecommendoffset:(NSString *)page Success:(void(^)(id success))success failure:(void(^)(id failure))failure;
+(void)getAllGonglveSuccess:(void(^)(id success))success failure:(void(^)(id failure))failure;
+(void)getNewPlayerListSuccess:(void(^)(id success))success failure:(void(^)(id failure))failure;
+(void)getNormalArticleWithId:(NSString *)articleId Success:(void(^)(id success))success failure:(void(^)(id failure))failure;
@end

NS_ASSUME_NONNULL_END
