//
//  NSArray+CKCrash.m
//  CKKit
//
//  Created by Clark on 2019/12/6.
//

#import "NSArray+CKCrash.h"
#import <objc/runtime.h>
#import "NSObject+CKSwizzling.h"

@implementation NSArray (CKCrash)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 可变数组
        // 插入
        [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSel:@selector(insertObject:atIndex:) swizzleSel:@selector(ck_insertObject:atIndex:)];
        // 替换
        [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSel:@selector(replaceObjectAtIndex:withObject:) swizzleSel:@selector(ck_replaceObjectAtIndex:withObject:)];
    });
}

- (void)ck_insertObject:(id)obj atIndex:(NSInteger)index {
    if (!obj || index > self.count) {
        @try {
            [self ck_insertObject:obj atIndex:index];
        } @catch (NSException *exception) {
            // 抛出异常
            return;
        } @finally {

        }
    }
    [self ck_insertObject:obj atIndex:index];
}

- (void)ck_replaceObjectAtIndex:(NSInteger)index withObject:(id)obj {
    if (!obj || index > self.count) {
        @try {
            [self ck_replaceObjectAtIndex:index withObject:obj];
        } @catch (NSException *exception) {
            // 抛出异常
            return;
        } @finally {

        }
    }
    [self ck_insertObject:obj atIndex:index];
}

@end
