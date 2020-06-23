//
//Created by ESJsonFormatForMac on 20/06/20.
//

#import <Foundation/Foundation.h>

@class GonglveResult,GonglveData,Allgonglvelist;
@interface GonglveModel : NSObject

@property (nonatomic, strong) GonglveResult *result;

@property (nonatomic, strong) GonglveData *data;

@end
@interface GonglveResult : NSObject

@property (nonatomic, assign) NSInteger code;

@end

@interface GonglveData : NSObject

@property (nonatomic, strong) NSArray *allGonglveList;

@end

@interface Allgonglvelist : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *titleZh;

@property (nonatomic, copy) NSString *endTag;

@end

