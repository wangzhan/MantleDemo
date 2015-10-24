//
//  GenericType.m
//  AppEmbeddedHttpServer
//
//  Created by wangzhan on 15/10/22.
//  Copyright © 2015年 wangzhan. All rights reserved.
//

#import "GenericType.h"
#import "MTLValueTransformer.h"

@interface GenericType ()

@property (strong, nonatomic) id innerValue;

@end

@implementation GenericType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"type": @"type",
        @"innerValue": @"value"
    };
}

+ (NSValueTransformer *)typeJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        *success = NO;
        id returnType = nil;
        if ([value isKindOfClass:[NSString class]]) {
            *success = YES;
            returnType = @([value integerValue]);
        }
        return returnType;
    } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        *success = NO;
        id returnType = nil;
        if ([value isKindOfClass:[NSNumber class]]) {
            *success = YES;
            returnType = [NSString stringWithFormat:@"%@", value];
        }
        return returnType;
    }];
}

- (id)value {
    return self.innerValue;
}

@end
