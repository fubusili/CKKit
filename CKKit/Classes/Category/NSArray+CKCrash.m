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
#ifndef DEBUG
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 可变数组
        // 插入
        [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSel:@selector(insertObject:atIndex:) swizzleSel:@selector(ck_insertObject:atIndex:)];
        // 替换
        [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSel:@selector(replaceObjectAtIndex:withObject:) swizzleSel:@selector(ck_replaceObjectAtIndex:withObject:)];
        // 获取
        [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSel:@selector(objectAtIndexedSubscript:) swizzleSel:@selector(ck_objectAtIndexedSubscript:)];
        
        // 不可变数组
        [self swizzleInstanceMethod:NSClassFromString(@"__NSArray0") originSel:@selector(objectAtIndex:) swizzleSel:@selector(ck_objectAtIndex:)];
    });
#endif
}

- (void)ck_insertObject:(id)obj atIndex:(NSInteger)index {
    if (!obj || index > self.count) {
        return;
    }
    [self ck_insertObject:obj atIndex:index];
}

- (void)ck_replaceObjectAtIndex:(NSInteger)index withObject:(id)obj {
    if (!obj || index > self.count) {
        return;
    }
    [self ck_replaceObjectAtIndex:index withObject:obj];
}

- (id)ck_objectAtIndexedSubscript:(NSInteger)index {
    if (index > self.count - 1 || !self.count) {
        return nil;
    }
    return [self ck_objectAtIndexedSubscript:index];
}

- (id)ck_objectAtIndex:(NSInteger)index {
    if (index > self.count - 1 || !self.count) {
        return nil;
    }
    return [self ck_objectAtIndex:index];
}

@end
