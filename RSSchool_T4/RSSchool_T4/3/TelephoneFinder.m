#import "TelephoneFinder.h"

@implementation TelephoneFinder

- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*) number {
    if ([number intValue] < 0) { return nil; }
    NSMutableArray *result = [NSMutableArray new];
    for (int i = 0 ; i < [number length]; i++){
        NSRange char_range = NSMakeRange(i, 1);
        NSArray *neighbours_array = nil;
        if ([[number substringWithRange:char_range]  isEqual: @"0"]) {
            neighbours_array = @[@"8"];
        } else if ([[number substringWithRange:char_range]  isEqual: @"1"]) {
             neighbours_array = @[@"2", @"4"];
        } else if ([[number substringWithRange:char_range]  isEqual: @"2"]) {
             neighbours_array = @[@"1", @"3", @"5"];
        } else if ([[number substringWithRange:char_range]  isEqual: @"3"]) {
             neighbours_array = @[@"2", @"6"];
        } else if ([[number substringWithRange:char_range]  isEqual: @"4"]) {
             neighbours_array = @[@"1", @"5", @"7"];
        } else if ([[number substringWithRange:char_range]  isEqual: @"5"]) {
             neighbours_array = @[@"2", @"4", @"6", @"8"];
        } else if ([[number substringWithRange:char_range]  isEqual: @"6"]) {
             neighbours_array = @[@"3", @"5", @"9"];
        } else if ([[number substringWithRange:char_range]  isEqual: @"7"]) {
             neighbours_array = @[@"4", @"8"];
        } else if ([[number substringWithRange:char_range]  isEqual: @"8"]) {
             neighbours_array = @[@"5", @"7", @"9", @"0"];
        } else if ([[number substringWithRange:char_range]  isEqual: @"9"]) {
             neighbours_array = @[@"6", @"8"];
        }
        for (int j = 0; j < [neighbours_array count]; j++){
            NSString* another_neighbour = [number stringByReplacingCharactersInRange:char_range withString:neighbours_array[j]];
            [result addObject:another_neighbour];
        }
    }
    return result;
}

@end
