//
//Created by ESJsonFormatForMac on 20/07/18.
//

#import "PostListModel.h"
@implementation PostListModel


@end

@implementation PostListResult


@end


@implementation PostListData

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list" : [PostListList class]};
}


@end


@implementation PostListList

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"content" : [PostListContent class]};
}


@end


@implementation PostListContent


@end


