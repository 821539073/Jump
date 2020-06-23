//
//Created by ESJsonFormatForMac on 20/06/18.
//

#import <Foundation/Foundation.h>

@class GameDiscountResult,GameDiscountData;
@interface GameDisCountModel : NSObject

@property (nonatomic, strong) GameDiscountResult *result;

@property (nonatomic, strong) GameDiscountData *data;

@end
@interface GameDiscountResult : NSObject

@property (nonatomic, assign) NSInteger code;

@end

@interface GameDiscountData : NSObject

@property (nonatomic, strong) NSArray *DateArr;

@property (nonatomic, strong) NSArray *countryArr;

@property (nonatomic, assign) float priceRaw;

@property (nonatomic, strong) NSArray *timeArr;

@property (nonatomic, strong) NSArray *priceArr;

@property (nonatomic, strong) NSArray *cutOffArr;

@end

