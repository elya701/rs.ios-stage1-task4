#import <Foundation/Foundation.h>

@interface SquareDecomposer : NSObject
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number;
- (NSMutableArray *)create_decomposed_array:(long)n left_number:(long)left_number cons_enter_number:(long)begin_number;
@end


