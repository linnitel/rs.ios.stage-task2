#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    NSMutableArray *sortedNumbers = [NSMutableArray new];
    NSMutableArray *sortedStrings = [NSMutableArray new];
    if (array) {
        NSInteger count = [array count];
        if (count > 0) {
            for (NSInteger index = 0; index < count; index++) {
                if ([array[index] isKindOfClass:[NSArray class]]) {
                    if ([array[index] isEqual:@[]]) {
                        continue;
                    }
                    if ([array[index][0] isKindOfClass:[NSNumber class]]) {
                        NSInteger countArray = [array[index] count];
                        for (NSInteger indexTwo = 0; indexTwo < countArray; indexTwo++) {
                            if (![array[index][indexTwo] isKindOfClass:[NSNumber class]]){
                                return @[];
                            }
                            [sortedNumbers addObject:(array[index][indexTwo])];
                        }
                    }
                    else if ([array[index][0] isKindOfClass:[NSString class]]) {
                        NSInteger countArray = [array[index] count];
                        for (NSInteger indexTwo = 0; indexTwo < countArray; indexTwo++) {
                            if (![array[index][indexTwo] isKindOfClass:[NSString class]]){
                                return @[];
                            }
                            [sortedStrings addObject:(array[index][indexTwo])];
                        }
                    }
                    else {
                        return @[];
                    }
                }
                else {
                    return @[];
                }
            }
            NSLog(@"Numbers before sort:");
            for (NSNumber *index in sortedNumbers){
                NSLog(@" %@ ", index);
            }
            NSLog(@"String before sort:");
            for (NSString *index in sortedStrings){
                NSLog(@" %@ ", index);
            }
            [sortedNumbers sortUsingSelector:@selector(compare:)];
            NSLog(@"Numbers after sort:");
            for (NSNumber *index in sortedNumbers){
                NSLog(@" %@ ", index);
            }
            NSLog(@"String after sort:");
            for (NSString *index in sortedStrings){
                NSLog(@" %@ ", index);
            }
        }
    }
    if (![sortedStrings isEqual:@[]] && ![sortedNumbers isEqual:@[]] ) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil
                                                ascending:NO];
        [sortedStrings sortUsingDescriptors:@[sortDescriptor]];
        return @[sortedNumbers, sortedStrings];
    }
    else if ([sortedStrings isEqual:@[]]) {
        return sortedNumbers;
    }
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil
                                            ascending:YES];
    [sortedStrings sortUsingDescriptors:@[sortDescriptor]];
    return sortedStrings;
}

@end
