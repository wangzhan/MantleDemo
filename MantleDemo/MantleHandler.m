//
//  MantleHandler.m
//  MantleDemo
//
//  Created by 王展 on 15/10/24.
//  Copyright © 2015年 王展. All rights reserved.
//

#import "MantleHandler.h"
#import "StaticMethodDescription.h"

@implementation MantleHandler

+ (void)handleTestCases {
    NSString *json = @"{"
        "\"class\": \"TestC\","
        "\"method\": \"staticGet\","
        "\"args\": ["
                 "{"
                     "\"type\": \"4\","
                     "\"value\": \"aaa\""
                 "},"
                 "{"
                     "\"type\": \"4\","
                     "\"value\": \"bbb\""
                 "}"
                 "],"
        "\"ret\": \"4\""
    "}";

    // generate the StaticMethodDescription object from json string
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    NSLog(@"source dict is %@", dict);
    NSError *error;
    StaticMethodDescription *des = [MTLJSONAdapter modelOfClass:[StaticMethodDescription class] fromJSONDictionary:dict error:&error];
    if (error) {
        NSLog(@"source error: %@", error);
        return;
    }
    
    NSLog(@"source object: %@", des);
    
    // generate the json string from StaticMethodDescription object
    dict = [MTLJSONAdapter JSONDictionaryFromModel:des error:nil];
    error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    if (!data) {
        NSLog(@"destination error: %@", error);
    }
    
    json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"destination json: %@", json);
}

@end
