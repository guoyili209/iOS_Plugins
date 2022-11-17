//
//  Bridge.m
//  PurchTest
//
//  Created by anni on 2022/11/17.
//

#import <Foundation/Foundation.h>
#import "Bridge.h"

@implementation Bridge
+ (Bridge*)Ins
{
    static Bridge* instance = nil;
    static dispatch_once_t once;

    dispatch_once(&once, ^{
        instance = [[self.class alloc] init];
    });
    return instance;
}

@end
