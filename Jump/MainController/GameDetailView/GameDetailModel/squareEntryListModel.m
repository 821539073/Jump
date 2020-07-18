//
//Created by ESJsonFormatForMac on 20/07/18.
//

#import "squareEntryListModel.h"
@implementation squareEntryListModel


@end

@implementation squareEntryListData

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list" : [squareEntryListList class]};
}


@end


@implementation squareEntryListList


+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

@end


