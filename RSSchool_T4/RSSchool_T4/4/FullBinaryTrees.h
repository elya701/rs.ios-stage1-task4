#import <Foundation/Foundation.h>

@interface Node : NSObject
@property (nonatomic, assign) NSInteger* val;
@property (nonatomic, assign) Node *left;
@property (nonatomic, assign) Node *right;
- (instancetype)initWithValue:(NSInteger* )value;
@end

@interface FullBinaryTrees : NSObject
- (NSString *)stringForNodeCount:(NSInteger)count;
@end
