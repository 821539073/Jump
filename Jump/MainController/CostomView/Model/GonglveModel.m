//
//Created by ESJsonFormatForMac on 20/06/20.
//

#import "GonglveModel.h"
@implementation GonglveModel


@end

@implementation GonglveResult


@end


@implementation GonglveData

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"allGonglveList" : [Allgonglvelist class]};
}


@end


@implementation Allgonglvelist


+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

@end


