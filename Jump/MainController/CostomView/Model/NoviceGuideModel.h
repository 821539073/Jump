//
//Created by ESJsonFormatForMac on 20/06/27.
//

#import <Foundation/Foundation.h>

@class NoviceGuideResult,NoviceGuideData,NoviceGuideplayerlist;
@interface NoviceGuideModel : NSObject

@property (nonatomic, strong) NoviceGuideResult *result;

@property (nonatomic, strong) NoviceGuideData *data;

@end
@interface NoviceGuideResult : NSObject

@property (nonatomic, assign) NSInteger code;

@end

@interface NoviceGuideData : NSObject

@property (nonatomic, strong) NSArray *playerList;

@end

@interface NoviceGuideplayerlist : NSObject

@property (nonatomic, copy) NSString *urlPath;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *picUrl;

@end

