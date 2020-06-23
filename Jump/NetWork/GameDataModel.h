//
//Created by ESJsonFormatForMac on 20/06/14.
//

#import <Foundation/Foundation.h>

@class Result,Data,Games;
@interface GameDataModel : NSObject

@property (nonatomic, strong) Result *result;

@property (nonatomic, strong) Data *data;

@end
@interface Result : NSObject

@property (nonatomic, assign) NSInteger code;

@end

@interface Data : NSObject

@property (nonatomic, strong) NSArray *games;

@property (nonatomic, assign) NSInteger hits;

@end

@interface Games : NSObject

@property (nonatomic, copy) NSString *appid;

@property (nonatomic, copy) NSString *lowestPrice;

@property (nonatomic, assign) float priceRaw;

@property (nonatomic, copy) NSString *recommendLabel;

@property (nonatomic, copy) NSString *titleZh;

@property (nonatomic, assign) NSInteger recommendLevel;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) float price;

@property (nonatomic, copy) NSString *leftDiscount;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger chineseVer;

@property (nonatomic, assign) NSInteger rate;

@property (nonatomic, copy) NSString *country;

@property (nonatomic, assign) NSInteger cutoff;

@property (nonatomic, assign) long long discountEnd;

@end

