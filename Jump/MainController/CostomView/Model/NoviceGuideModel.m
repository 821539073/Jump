//
//Created by ESJsonFormatForMac on 20/06/27.
//

#import "NoviceGuideModel.h"
@implementation NoviceGuideModel


@end

@implementation NoviceGuideResult


@end


@implementation NoviceGuideData

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"playerList" : [NoviceGuideplayerlist class]};
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"playerList":@"newPlayerList"};
}

@end


@implementation NoviceGuideplayerlist


+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

@end


