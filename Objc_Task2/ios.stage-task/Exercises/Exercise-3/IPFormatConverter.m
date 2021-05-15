#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSInteger count = [numbersArray count];
    if (!numbersArray || count == 0) {
        return @"";
    }
    NSInteger numOct = 4;
    NSMutableString *temp = [NSMutableString new];
    for (NSInteger index = 0; index < numOct; index++) {
        if (index < count && [numbersArray[index] intValue] < 0) {
            [temp setString:@"Negative numbers are not valid for input."];
            break;
        }
        if (index < count && [numbersArray[index] intValue] > 225) {
            [temp setString:@"The numbers in the input array can be in the range from 0 to 255."];
            break;
        }
        if (index >= count) {
            [temp appendFormat:@"%@", @"0"];
        }
        else {
            [temp appendFormat:@"%@", numbersArray[index]];
        }
        if (index != numOct - 1) {
            [temp appendFormat:@"%@", @"."];
        }
    }
    NSString *IPv4 = [[NSString alloc] initWithString:temp];
    return IPv4;
}

@end
