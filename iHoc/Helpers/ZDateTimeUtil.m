//
//  SVDateTimeUtil.m
//  Savvee
//

#import "ZDateTimeUtil.h"

@implementation ZDateTimeUtil

+ (NSString *)getDisplayDateStringFromTimeStamp:(NSInteger)timeStamp
{
    if (timeStamp!=0) {
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        dateFormatter.dateFormat = @"dd'-'MM'-'yyyy";
        return [dateFormatter stringFromDate:date];
    }
    return @"Không xác định";
}
@end
