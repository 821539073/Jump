//
//Created by ESJsonFormatForMac on 20/06/16.
//

#import "GameIntroduceModle.h"
@implementation GameIntroduceModle


@end

@implementation IntroduceResult


@end


@implementation IntroduceData

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"prices" : [Prices class]};
}


@end


@implementation IntroduceGame

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"languageRegion" : [Languageregion class]};
}


@end


@implementation Gamemapbean


+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

@end


@implementation Languageregion


@end


@implementation Prices


@end


