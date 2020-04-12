#import "SquareDecomposer.h"

@implementation SquareDecomposer

- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    long n = [number longValue];
    long our_squared_number = pow(n, 2);
    NSMutableArray *result_array = [self create_decomposed_array:n left_number:our_squared_number cons_enter_number: n];
    if (result_array == nil) { return nil; }
    return result_array;
}

- (NSMutableArray *)create_decomposed_array:(long)n left_number:(long)left_number cons_enter_number:(long)begin_number {
    NSMutableArray *result = [NSMutableArray new];
    NSNumber* n_number = [NSNumber numberWithLong:n];
    if (left_number == 0) { return [NSMutableArray arrayWithObject:n_number]; }
    long tmp = n - 1;
    for(long i = tmp; i > 0; i -= 1) {
        long our_squared_number = pow(i, 2);
        long check = left_number - our_squared_number;
        if(check >= 0){
            long next_step_n = i;
            long next_step_left_number = left_number - our_squared_number;
            result = [self create_decomposed_array:next_step_n left_number:next_step_left_number cons_enter_number:n];
            
            if (result != nil){
                if ([n_number longValue] == begin_number) {
                     return result;
                } else {
                [result addObject:n_number];
                return result;
                }
            }
        }
    }
    return nil;
}

@end
