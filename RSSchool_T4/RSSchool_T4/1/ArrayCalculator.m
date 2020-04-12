#import "ArrayCalculator.h"

@implementation ArrayCalculator


+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    
    int n = numberOfItems;
    int result = 1;
    int min_plus = 0;
    int min_minus = 0;
    
    NSArray* sorted_array = [self  correct_array:array];
    if (sorted_array.count == 0) { return 0; }
    
    if (sorted_array.count <= n) {
        for (NSNumber* i in sorted_array) {
            result *= i.intValue;
        }
        return result;
    }

    for (int i = 0; i < sorted_array.count; i++){
        int our_number = [sorted_array[i] intValue];
        if (i >= n) {
            if (result < 0) {
                if (our_number < 0) { result = result * our_number / min_plus;
                } else if (our_number > 0) { result = result * our_number / min_minus;
                } else { break; }
            }
        } else {
            if (our_number > 0) {
                if (our_number < min_plus || min_plus == 0) { min_plus = our_number; }
            } else {
                if (our_number > min_minus || min_minus == 0) { min_minus = our_number; }
            }
            result *= our_number;
        }
    }
    return result;
}

+ (NSArray *)sort_array:(NSArray *)array {
    NSArray *mainArray = [array sortedArrayUsingComparator:^(id element_a, id element_b) {
        if (abs([element_a intValue]) < abs([element_b intValue])) {
            return NSOrderedDescending;
        } else if (abs([element_b intValue]) < abs([element_a intValue])) {
            return NSOrderedAscending;
        } else {
            return NSOrderedSame;
        }
    }];
    return mainArray;
}

+ (NSArray *)correct_array:(NSArray *)array {
    NSMutableArray *mainArray = [array mutableCopy];
    Class class = [NSNumber class];
    [mainArray removeObjectIdenticalTo:[NSNull null]];
    [mainArray filterUsingPredicate:[NSPredicate predicateWithFormat: @"self isKindOfClass: %@", class]];
    
    NSArray* result = mainArray = [self sort_array:mainArray];
    return result;
}

@end
