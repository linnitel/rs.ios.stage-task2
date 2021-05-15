#import "Pairs.h"

@implementation Pairs


- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger pairsNum = 0;
    NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(compare:)];
    NSInteger count = [sortedArray count];
    for (NSInteger index = 0; index < count - 1; index++) {
        for (NSInteger indexTwo = index + 1; indexTwo < count; indexTwo++) {
            if (abs([sortedArray[index] intValue] - [sortedArray[indexTwo] intValue]) == [number intValue]) {
                pairsNum++;
            }
        }
    }
    return pairsNum;
}

@end
