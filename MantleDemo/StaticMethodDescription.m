//
//  StaticMethodDescription.m
//  AppEmbeddedHttpServer
//
//  Created by wangzhan on 15/10/22.
//  Copyright © 2015年 wangzhan. All rights reserved.
//

#import "StaticMethodDescription.h"
#import "MTLValueTransformer.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"

@implementation StaticMethodDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"className": @"class",
        @"methodName": @"method",
        @"arguments": @"args",
        @"returnType": @"ret"
    };
}


+ (NSValueTransformer *)argumentsJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[GenericType class]];
}

+ (NSValueTransformer *)returnTypeJSONTransformer {
    return [GenericType typeJSONTransformer];
}

@end
