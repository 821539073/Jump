//
//  NetWorkObject.m
//  Jump
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "NetWorkObject.h"
//#import "JsonDataModle.h"

@implementation NetWorkObject

//忽略验证
+ (AFSecurityPolicy*)customSecurityPolicy{
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    securityPolicy.allowInvalidCertificates = YES;
    [securityPolicy setValidatesDomainName:NO];
    return securityPolicy;
}

+(void)bannerListSuccess:(void(^)(id success))success failure:(void(^)(id failure))failure{
    
   AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
     [manager setSecurityPolicy:[self customSecurityPolicy]];
    [manager GET:@"https://switch.jumpvg.com/switch/banner/list?version=42" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];

    
}

+(void)GameWithSearchType:(NSDictionary *)TypeDic Success:(void(^)(id success))success failure:(void(^)(id failure))failure{
    
    NSString *url = @"https://switch.jumpvg.com/switch/gameDlc/list?";
    for (NSString *dicKey in [TypeDic allKeys]) {
        url = [url stringByAppendingString:[NSString stringWithFormat:@"%@=%@&",dicKey,[TypeDic objectForKey:dicKey]]];
    }
    url = [url stringByAppendingString:@"all=1&limit=10&scene=1089"];
   // NSString *url1 = @"https://switch.jumpvg.com/switch/gameDlc/list?ifDiscount=true&title=&orderByDiscountStart=-1&orderByDiscountEnd=0&orderByCutoff=0&orderByRate=0&hotType=index&recommend=0&subCate=featured&all=true&offset=1&limit=10&scene=1089";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
     [manager setSecurityPolicy:[self customSecurityPolicy]];
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

+(void)GameDetialCode:(NSString *)code Success:(void(^)(id success))success failure:(void(^)(id failure))failure{
    NSString *url = [@"https://switch.jumpvg.com/switch/gameInfo?system=iOS%2013.4.1&platform=ios&fromName=discount&appid=" stringByAppendingString:code];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
     [manager setSecurityPolicy:[self customSecurityPolicy]];
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}


//FBCWWSXNNQ_ZKDQA

+(void)ListGameComment:(NSString *)gameCode Success:(void(^)(id success))success failure:(void(^)(id failure))failure{
    
    NSString *url = [@"https://switch.jumpvg.com/switch/comment/listGameComment?version=2&moduleId=1&commentId=&self=true&attitude=-1&orderByCreateTime=-1&orderByHappyNum=0&orderByScore=-1&offset=0&limit=10&count=true&acceptor=" stringByAppendingString:gameCode];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
     [manager setSecurityPolicy:[self customSecurityPolicy]];
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+(void)GameDiscount:(NSString *)gameCode Success:(void(^)(id success))success failure:(void(^)(id failure))failure{
    NSString *url = [@"https://switch.jumpvg.com/switch/getDiscount?appid=" stringByAppendingString:gameCode];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
     [manager setSecurityPolicy:[self customSecurityPolicy]];
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+(void)TodayGameRecommendoffset:(NSString *)page Success:(void(^)(id success))success failure:(void(^)(id failure))failure{
    NSString *url = [@"https://switch.jumpvg.com/switch/informationFlow/list?lastType=0&lastSubType=0&lastAcceptorId=&limit=10&offset=" stringByAppendingString:page];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
     [manager setSecurityPolicy:[self customSecurityPolicy]];
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}
+(void)getAllGonglveSuccess:(void(^)(id success))success failure:(void(^)(id failure))failure{
    NSString *url =@"https://switch.jumpvg.com/switch/gonglve/getAllGonglve";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    [manager setSecurityPolicy:[self customSecurityPolicy]];
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
+(void)getNewPlayerListSuccess:(void(^)(id success))success failure:(void(^)(id failure))failure{
    NSString *url =@"https://switch.jumpvg.com/switch/newPlayer/newPlayerList";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    [manager setSecurityPolicy:[self customSecurityPolicy]];
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}
+(void)getNormalArticleWithId:(NSString *)articleId Success:(void(^)(id success))success failure:(void(^)(id failure))failure{
    
    NSString *url = [@"https://switch.jumpvg.com/switch/normalArticle/getNormalArticle?id=" stringByAppendingString:articleId];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    [manager setSecurityPolicy:[self customSecurityPolicy]];
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
+(void)getPostListEntityIdStr:(NSString *)entityIdStr Success:(void(^)(id success))success failure:(void(^)(id failure))failure{
    
    NSString *url = [@"https://switch.jumpvg.com/switch/post/list?moduleId=1&entityIdStr=%@&offset=0&sortType=postDefault&version=2&limit=10" stringByAppendingString:entityIdStr];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    [manager setSecurityPolicy:[self customSecurityPolicy]];
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
    
}



//自己服务器
+(void)addToolWithDic:(NSDictionary *)toolDic Success:(void(^)(id success))success failure:(void(^)(id failure))failure{
    
    
    NSString *url = [@"http://106.14.127.196:8000/addTool?" stringByAppendingFormat:@"cellName=%@&cellPic=%@",[toolDic objectForKey:@"cellName"],[toolDic objectForKey:@"cellPic"]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   // manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    //[manager setSecurityPolicy:[self customSecurityPolicy]];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:[url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

+(void)searchAllToolSuccess:(void(^)(id success))success failure:(void(^)(id failure))failure{
    
     NSString *url = @"http://106.14.127.196:8000/searchAllTool";
     AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
     //[manager setSecurityPolicy:[self customSecurityPolicy]];
     manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
     [manager GET:[url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         success(responseObject);
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         failure(error);
     }];
}
+(void)removeAllToolSuccess:(void(^)(id success))success failure:(void(^)(id failure))failure{
    
     NSString *url = @"http://106.14.127.196:8000/removeAllTool";
     AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
     //[manager setSecurityPolicy:[self customSecurityPolicy]];
     manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
     [manager GET:[url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         success(responseObject);
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         failure(error);
     }];
}

+(void)removeToolWithName:(NSString *)cellName Success:(void(^)(id success))success failure:(void(^)(id failure))failure{
    
     NSString *url = [@"http://106.14.127.196:8000/removeToolWithName?cellName=" stringByAppendingString:cellName];
     AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
     //[manager setSecurityPolicy:[self customSecurityPolicy]];
     manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
     [manager GET:[url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         success(responseObject);
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         failure(error);
     }];
    
}

//http://106.14.127.196:8000/addTool?cellName=111&cellPic=222
//http://106.14.127.196:8000/searchAllTool
//http://106.14.127.196:8000/removeAllTool
//http://106.14.127.196:8000/removeToolWithName?cellName=111
@end
