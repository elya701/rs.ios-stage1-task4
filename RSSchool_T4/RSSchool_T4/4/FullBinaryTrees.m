#import "FullBinaryTrees.h"

@implementation Node
- (instancetype) initWithValue:(NSInteger* )value {
    self = [super init];
    if (self != nil) {
        self.val = value;
        self.left = nil;
        self.right = nil;
    }
    return self;
}
@end

#import "FullBinaryTrees.h"

@implementation FullBinaryTrees

- (NSString *)stringForNodeCount:(NSInteger)count {
    return [self print_string_from_nodes:[self allPosibleFBT:count] count:count];
}


- (NSArray *)allPosibleFBT:(NSInteger)count {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    if (count == 0 || count % 2 == 0) { return result; }
    if (count == 1) {
        Node *currentNode = [[Node alloc] initWithValue:0];
        [result addObject:currentNode];
        return result;
    } else {
        for (int i = 1; i < count; i += 2) {
            NSArray* leftNodes = [self allPosibleFBT:i];
            NSArray* rightNodes = [self allPosibleFBT:count - i - 1];
            
            for (Node *left in leftNodes) {
                for (Node *right in rightNodes) {
                    Node *node = [[Node alloc] initWithValue:0];
                    node.left = left;
                    node.right = right;
                    [result addObject:node];
                }
            }
        }
    }
    return result;
}


- (NSString *)print_string_from_nodes:(NSArray *)nodes_array count:(NSInteger)count {
    NSMutableString *result = [[NSMutableString alloc] init];
    [result appendString:@"["];
    
    for (Node *node in nodes_array) {
        NSMutableString *our_tmp_node_string = [[NSMutableString alloc] init];
        [our_tmp_node_string appendString:@"["];
        [our_tmp_node_string appendString:[self print_string_from_node:node count:count]];
        if ([node isEqual:[nodes_array lastObject]]) {
            [our_tmp_node_string appendString:@"]"];
        } else {
            [our_tmp_node_string appendString:@"],"];
        }
        [result appendString:our_tmp_node_string];
    }
    [result appendString:@"]"];
    return result;
}


- (NSString *)print_string_from_node:(Node* )node count:(NSInteger)count {
    
    NSInteger our_nodes_counter = 0;
    NSInteger sub_nodes_counter = 1;
    
    NSMutableArray *our_nodes = [NSMutableArray arrayWithObject:node];
    NSMutableString *result = [[NSMutableString alloc] init];
    [result appendString:@"0,"];
    
    while (our_nodes_counter < count) {
        Node* tmp_node = [our_nodes firstObject];
        [our_nodes removeObjectAtIndex:0];
        
        if (tmp_node.left && tmp_node.right) {
            
            [result appendString:@"0,0,"];
            [our_nodes addObject:tmp_node.left];
            [our_nodes addObject:tmp_node.right];
            our_nodes_counter += 1;
            sub_nodes_counter += 2;
        } else {
            if (sub_nodes_counter < count) {
                [result appendString:@"null,null,"];
            }
            our_nodes_counter += 1;
        }
    }
    NSRange range = NSMakeRange(result.length - 1, 1);
    [result deleteCharactersInRange:range];
    return result;
}

@end
