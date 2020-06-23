//
//Created by ESJsonFormatForMac on 20/06/18.
//

#import "GameComment.h"
@implementation GameComment


@end

@implementation CommentListResult


@end


@implementation CommentListData

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"comment" : [Comment class]};
}


@end


@implementation Comment

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"content" : [Content class]};
}


@end


@implementation Content


@end


